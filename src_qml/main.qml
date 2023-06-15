import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import Qt.labs.platform 1.1
import "./common_js/Color.js" as Color
import "./common_component/Route"
import "./common_component/MaterialUI"
import "./common_qml"
import "./instance_component/Navbar"
import "./instance_component/SQLTable/SettingData"
import "./instance_component/SystemTray"
import "./pages/HomePage"
import "./pages/Display"
import "./pages/Api"

Window {
    id: mainWindow
    width: 900
    height: 600
    minimumWidth: 900
    minimumHeight: 600
    visible: true
    title: qsTr("MaterialUI")

    function quitApp() {
        console.log("quitApp")
        Qt.quit()
    }

    function onAppEvent(type, data) {
        if (type === "MAC_ApplicationActive") {
            mainWindow.show()
        }
        else if (type === "MAC_Quit") {
            quitApp()
        }
    }

    // 可能是qmltype信息不全，有M16警告，这里屏蔽下
    // @disable-check M16
    onClosing: function(closeevent) {
        let route_stack = Route.getStack()
        console.log("(main.qml)Save route", JSON.stringify(route_stack))
        SettingData.setValue('RouteStack', route_stack)
        mainWindow.hide()
//        CloseEvent的accepted设置为false就能忽略该事件
        closeevent.accepted = false
    }

    RowLayout {
        id: main_area
        anchors.fill: parent
        spacing: 0

        Navbar {
            RowLayout.fillHeight: true
        }

        StackView {
            id: stackView
            RowLayout.fillHeight: true
            RowLayout.fillWidth: true
//            initialItem: buttonbase_api
            initialItem: home_page

            Component.onCompleted: {
                AppEventFilter.appEvent.connect(onAppEvent)
                SettingData.getValue('RouteStack', function(value) {
                    console.log("(main.qml)Recover route", JSON.stringify(value))
                    if (!value || value.length === 0) {
                        return
                    }

                    if (value.length === 1 && value[0].url === '/') {
                        return
                    }

                    Route.setStack(value)

                    stackView.pop()
                    for (let i = 0; i < value.length; i++) {
                        let url = value[i].url
                        console.log(url)
                        stackView.push(route_map[url], StackView.Immediate)
                    }
                })
            }
        }
    }

    Component {
        id: home_page
        HomePage { }
    }

    Component {
        id: button_page
        ButtonPage { }
    }

    Component {
        id: button_api
        ButtonApi { }
    }

    Component {
        id: buttonbase_api
        ButtonBaseApi { }
    }

    Component {
        id: icon_api
        IconApi { }
    }

    property var route_map: {
        "/": home_page,
        "/buttonpage": button_page,
        "/api/button": button_api,
        "/api/buttonbase": buttonbase_api,
        "/api/icon": icon_api,
    }

    Connections {
        target: Route

        function onSwitchToCallback(url) {
            stackView.push(route_map[url], StackView.Immediate)
        }

        function onRedirectToCallback(url) {
            stackView.pop()
            stackView.push(route_map[url], StackView.Immediate)
        }

        function onNavigateToCallback(url) {
            stackView.push(route_map[url])
        }

        function onNavigateBackCallback(count) {
            for (let i = 0; i < count; i++) {
                stackView.pop()
            }
        }
    }

    SystemTray {
        onShowWindow: {
            mainWindow.show()
            mainWindow.requestActivate()
        }

        onQuitApp: {
            mainWindow.quitApp()
        }
    }
}
