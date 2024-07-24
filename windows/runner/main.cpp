#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <memory>
#include <windows.h>

#include "flutter_window.h"
#include "utils.h"

// Method to disable screen capture
void DisableScreenCapture() {
    HWND hwnd = GetActiveWindow();
    DWORD style = GetWindowLong(hwnd, GWL_EXSTYLE);
    style |= WS_EX_NOREDIRECTIONBITMAP;
    SetWindowLong(hwnd, GWL_EXSTYLE, style);
    SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA);
}

// Method to enable screen capture
void EnableScreenCapture() {
    HWND hwnd = GetActiveWindow();
    DWORD style = GetWindowLong(hwnd, GWL_EXSTYLE);
    style &= ~WS_EX_NOREDIRECTIONBITMAP;
    SetWindowLong(hwnd, GWL_EXSTYLE, style);
    SetLayeredWindowAttributes(hwnd, 0, 255, LWA_ALPHA);
}

// Method to disable printers
void DisablePrinters() {
    HANDLE hPrinter;
    PRINTER_DEFAULTS pd;
    PRINTER_INFO_2* pinfo = NULL;
    DWORD cbBuf = 0;
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

// Register method channel and handle calls
void RegisterAppControlPlugin(flutter::PluginRegistry* registry) {
    auto channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registry->GetMessenger(), "myapp/app_control",
                    &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
            [](const flutter::MethodCall<flutter::EncodableValue>& call,
               std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
                if (call.method_name().compare("disableScreenCapture") == 0) {
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

    registry->AddPlugin(std::move(channel));
}

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
        _In_ wchar_t *command_line, _In_ int show_command) {
// Attach to console when present (e.g., 'flutter run') or create a
// new console when running with a debugger.
if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
CreateAndAttachConsole();
}

// Initialize COM, so that it is available for use in the library and/or
// plugins.
::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

flutter::DartProject project(L"data");

std::vector<std::string> command_line_arguments = GetCommandLineArguments();
project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

FlutterWindow window(project);
Win32Window::Point origin(10, 10);
Win32Window::Size size(1280, 720);
if (!window.Create(L"emantrimandal", origin, size)) {
return EXIT_FAILURE;
}
window.SetQuitOnClose(true);

// Register the plugin for app control (screen capture and printers)
RegisterAppControlPlugin(flutter::PluginRegistry::GetInstance());

::MSG msg;
while (::GetMessage(&msg, nullptr, 0, 0)) {
::TranslateMessage(&msg);
::DispatchMessage(&msg);
}

::CoUninitialize();
return EXIT_SUCCESS;
}
