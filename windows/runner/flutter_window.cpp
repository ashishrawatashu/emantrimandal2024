#include "flutter_window.h"
#include <optional>
#include "flutter/generated_plugin_registrant.h"

#include <string>
#include <flutter/binary_messenger.h>
#include <flutter/standard_method_codec.h>
#include <flutter/method_channel.h>
#include <flutter/method_result_functions.h>
#include <flutter/encodable_value.h>
#include <../standard_codec.cc>
#include "windows.h"
#include "windef.h"
#include "windowsx.h"
#include <iostream>
#include <Windows.h>
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

void initMethodChannel(flutter::FlutterEngine* flutter_instance) {

    const static std::string channel_name("mac_address");
    flutter::BinaryMessenger* messenger = flutter_instance->messenger();
    const flutter::StandardMethodCodec* codec = &flutter::StandardMethodCodec::GetInstance();
    auto channel = std::make_unique<flutter::MethodChannel<>>(messenger ,channel_name ,codec);

    channel->SetMethodCallHandler(
            [](const flutter::MethodCall<>& call,
               std::unique_ptr<flutter::MethodResult<>> result) {

                // check method name called from dart
                if (call.method_name().compare("getMacAddress") == 0) {

                 std::string macAddress = getMacAddress();
                 if (!macAddress.empty()) {
                    flutter::EncodableValue res(macAddress);
                    result->Success(res);
                     } else {
                     flutter::EncodableValue res("N/A");
                     result->Success(res);
                    }
                }
                else {
                    result->NotImplemented();
                }
            }
    );
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
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
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