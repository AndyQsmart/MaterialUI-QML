import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
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
    width: 940
    height: 600
    minimumWidth: 940
    minimumHeight: 600
    visible: true
    title: qsTr("MaterialUI")

    function quitApp() {
        let route_stack = Route.getStack()
        console.log("(main.qml)Save route", JSON.stringify(route_stack))
        SettingData.setValue('RouteStack', route_stack)
        console.log("quitApp")
        Qt.quit()
    }

    function onAppEvent(type, data) {
        if (type === "MAC_ApplicationActive") {
            mainWindow.visible = true
        }
        else if (type === "MAC_Quit") {
            quitApp()
        }
    }

    // 可能是qmltype信息不全，有M16警告，这里屏蔽下
    // @disable-check M16
    onClosing: function(closeevent) {
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
        id: buttongroup_page
        ButtonGroupPage { }
    }

    Component {
        id: checkbox_page
        CheckboxPage { }
    }

    Component {
        id: datetimepicker_page
        DateTimePickerPage { }
    }

    Component {
        id: colorpicker_page
        ColoPickerPage { }
    }

    Component {
        id: framelesswindow_page
        FramelessWindowPage { }
    }

    Component {
        id: radio_page
        RadioPage { }
    }

    Component {
        id: select_page
        SelectPage { }
    }

    Component {
        id: slider_page
        SliderPage { }
    }

    Component {
        id: switch_page
        SwitchPage { }
    }

    Component {
        id: textfield_page
        TextFieldPage { }
    }

    Component {
        id: paper_page
        PaperPage { }
    }

    Component {
        id: progress_page
        ProgressPage { }
    }

    Component {
        id: icon_page
        IconPage { }
    }

    Component {
        id: fontawesomeicon_page
        FontAwesomeIconPage { }
    }

    Component {
        id: svgicon_page
        SvgIconPage { }
    }

    Component {
        id: transitions_page
        TransitionsPage { }
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
        id: buttongroup_api
        ButtonGroupApi { }
    }

    Component {
        id: checkbox_api
        CheckboxApi { }
    }

    Component {
        id: circularprogress_api
        CircularProgressApi { }
    }

    Component {
        id: colorpicker_api
        ColorPickerApi { }
    }

    Component {
        id: complexselect_api
        ComplexSelectApi { }
    }

    Component {
        id: datepicker_api
        DatePickerApi { }
    }

    Component {
        id: formcontrollabel_api
        FormControlLabelApi { }
    }

    Component {
        id: framelesswindow_api
        FramelessWindowApi { }
    }

    Component {
        id: icon_api
        IconApi { }
    }

    Component {
        id: linearprogress_api
        LinearProgressApi { }
    }

    Component {
        id: paper_api
        PaperApi { }
    }

    Component {
        id: radio_api
        RadioApi { }
    }

    Component {
        id: radiogroup_api
        RadioGroupApi { }
    }

    Component {
        id: select_api
        SelectApi { }
    }

    Component {
        id: slider_api
        SliderApi { }
    }

    Component {
        id: svgicon_api
        SvgIconApi { }
    }

    Component {
        id: switch_api
        SwitchApi { }
    }

    Component {
        id: textfield_api
        TextFieldApi { }
    }

    Component {
        id: timepicker_api
        TimePicker { }
    }

    property var route_map: {
        "/": home_page,
        "/buttonpage": button_page,
        "/buttongrouppage": buttongroup_page,
        "/checkboxpage": checkbox_page,
        "/datetimepickerpage": datetimepicker_page,
        "/colorpickerpage": colorpicker_page,
        "/framelesswindowpage": framelesswindow_page,
        "/radiopage": radio_page,
        "/selectpage": select_page,
        "/sliderpage": slider_page,
        "/switchpage": switch_page,
        "/textfieldpage": textfield_page,
        "/paperpage": paper_page,
        "/progresspage": progress_page,
        "/iconpage": icon_page,
        "/fontawesomeiconpage": fontawesomeicon_page,
        "/svgiconpage": svgicon_page,
        "/transitionspage": transitions_page,
        "/api/button": button_api,
        "/api/buttonbase": buttonbase_api,
        "/api/buttongroup": buttongroup_api,
        "/api/checkbox": checkbox_api,
        "/api/circularprogress": circularprogress_api,
        "/api/colorpicker": colorpicker_api,
        "/api/complexselect": complexselect_api,
        "/api/datepicker": datepicker_api,
        "/api/formcontrollabel": formcontrollabel_api,
        "/api/framelesswindow": framelesswindow_api,
        "/api/icon": icon_api,
        "/api/linearprogress": linearprogress_api,
        "/api/paper": paper_api,
        "/api/radio": radio_api,
        "/api/radiogroup": radiogroup_api,
        "/api/select": select_api,
        "/api/slider": slider_api,
        "/api/svgicon": svgicon_api,
        "/api/switch": switch_api,
        "/api/textfield": textfield_api,
        "/api/timepicker": timepicker_api,
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
            mainWindow.visible = true
            mainWindow.requestActivate()
        }

        onQuitApp: {
            mainWindow.quitApp()
        }
    }
}
