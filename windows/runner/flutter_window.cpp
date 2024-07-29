#include "flutter_window.h"
#include <optional>
#include "flutter/generated_plugin_registrant.h"

#include <string>
#include <flutter/binary_messenger.h>
#include <flutter/standard_method_codec.h>
#include <flutter/method_channel.h>
#include <flutter/method_result_functions.h>
#include <flutter/encodable_value.h>
#include "windows.h"
#include <iphlpapi.h>

#pragma comment(lib, "iphlpapi.lib")

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
        : project_(project) {}

FlutterWindow::~FlutterWindow() {}

std::string getMacAddress() {
    IP_ADAPTER_INFO AdapterInfo[16]; // Allocate information for up to 16 NICs
    DWORD dwBufLen = sizeof(AdapterInfo); // Save the size of the buffer
    DWORD dwStatus = GetAdaptersInfo(AdapterInfo, &dwBufLen); // Call GetAdapterInfo

    if (dwStatus != ERROR_SUCCESS) {
        std::cerr << "GetAdaptersInfo failed with error: " << dwStatus << std::endl;
        return "";
    }

    PIP_ADAPTER_INFO pAdapterInfo = AdapterInfo; // Contains pointer to current adapter info
    if (pAdapterInfo) {
        char macAddr[18]; // MAC address is 6 bytes (48 bits) plus 5 colons and null terminator
        sprintf_s(macAddr, "%02X:%02X:%02X:%02X:%02X:%02X",
                  pAdapterInfo->Address[0], pAdapterInfo->Address[1],
                  pAdapterInfo->Address[2], pAdapterInfo->Address[3],
                  pAdapterInfo->Address[4], pAdapterInfo->Address[5]);
        return std::string(macAddr);
    }

    return "";
}

void DisableScreenCapture() {
    HWND hwnd = GetActiveWindow();
    DWORD style = GetWindowLong(hwnd, GWL_EXSTYLE);
    style |= WS_EX_NOREDIRECTIONBITMAP;
    SetWindowLong(hwnd, GWL_EXSTYLE, style);
    SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA);
}

void EnableScreenCapture() {
    HWND hwnd = GetActiveWindow();
    DWORD style = GetWindowLong(hwnd, GWL_EXSTYLE);
    style &= ~WS_EX_NOREDIRECTIONBITMAP;
    SetWindowLong(hwnd, GWL_EXSTYLE, style);
    SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA);
}

void DisablePrinters() {
    HANDLE hPrinter;
    PRINTER_DEFAULTS pd;
    PRINTER_INFO_2* pinfo = NULL;
    DWORD pcbNeeded = 0;
    DWORD pcReturned = 0;

    pd.pDatatype = NULL;
    pd.pDevMode = NULL;
    pd.DesiredAccess = PRINTER_ACCESS_ADMINISTER;

    EnumPrinters(PRINTER_ENUM_LOCAL | PRINTER_ENUM_CONNECTIONS, NULL, 2, NULL, 0, &pcbNeeded, &pcReturned);
    pinfo = (PRINTER_INFO_2*)malloc(pcbNeeded);
    if (pinfo == NULL) return;

    if (!EnumPrinters(PRINTER_ENUM_LOCAL | PRINTER_ENUM_CONNECTIONS, NULL, 2, (LPBYTE)pinfo, pcbNeeded, &pcbNeeded, &pcReturned)) {
        free(pinfo);
        return;
    }

    for (DWORD i = 0; i < pcReturned; i++) {
        if (OpenPrinter(pinfo[i].pPrinterName, &hPrinter, &pd)) {
            pinfo[i].Attributes |= PRINTER_ATTRIBUTE_WORK_OFFLINE;
            SetPrinter(hPrinter, 2, (LPBYTE)&pinfo[i], 0);
            ClosePrinter(hPrinter);
        }
    }

    free(pinfo);
}

void initMethodChannel(flutter::FlutterEngine* flutter_instance) {
    const static std::string channel_name("mac_address");
    flutter::BinaryMessenger* messenger = flutter_instance->messenger();
    const flutter::StandardMethodCodec* codec = &flutter::StandardMethodCodec::GetInstance();
    auto channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            messenger, channel_name, codec);

    channel->SetMethodCallHandler(
            [](const flutter::MethodCall<flutter::EncodableValue>& call,
               std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
                if (call.method_name().compare("getMacAddress") == 0) {
                    std::string macAddress = getMacAddress();
                    result->Success(macAddress.empty() ? flutter::EncodableValue("N/A") : flutter::EncodableValue(macAddress));
                } else if (call.method_name().compare("disableScreenCapture") == 0) {
                    DisableScreenCapture();
                    result->Success();
                } else if (call.method_name().compare("enableScreenCapture") == 0) {
                    EnableScreenCapture();
                    result->Success();
                } else if (call.method_name().compare("disablePrinters") == 0) {
                    DisablePrinters();
                    result->Success();
                } else {
                    result->NotImplemented();
                }
            });
}

bool FlutterWindow::OnCreate() {
    if (!Win32Window::OnCreate()) {
        return false;
    }

    RECT frame = GetClientArea();

    // The size here must match the window dimensions to avoid unnecessary surface
    // creation / destruction in the startup path.
    flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
            frame.right - frame.left, frame.bottom - frame.top, project_);
    // Ensure that basic setup of the controller was successful.
    if (!flutter_controller_->engine() || !flutter_controller_->view()) {
        return false;
    }
    RegisterPlugins(flutter_controller_->engine());
    initMethodChannel(flutter_controller_->engine());
    SetChildContent(flutter_controller_->view()->GetNativeWindow());

    flutter_controller_->engine()->SetNextFrameCallback([&]() {
        this->Show();
    });

    return true;
}

void FlutterWindow::OnDestroy() {
    if (flutter_controller_) {
        flutter_controller_ = nullptr;
    }

    Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
// Give Flutter, including plugins, an opportunity to handle window messages.
if (flutter_controller_) {
std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam, lparam);
if (result) {
return *result;
}
}

switch (message) {
case WM_FONTCHANGE:
flutter_controller_->engine()->ReloadSystemFonts();
break;
}

return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
