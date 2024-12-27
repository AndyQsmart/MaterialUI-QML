cmake_minimum_required(VERSION 3.16)

project(MaterialUI-QML-Qt6 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)

qt_add_executable(MaterialUI_QML_Qt6
    src/utils/application_event_filter.h
    src/utils/application_event_filter.cpp
    main.cpp
)

# qml文件列表
set(plain_qml_files
    src_qml/Main.qml
    src_qml/common_component/MaterialUI/colors/Grey.qml
    src_qml/common_component/MaterialUI/colors/Indigo.qml
    src_qml/common_component/MaterialUI/colors/Pink.qml
    src_qml/common_component/MaterialUI/colors/Red.qml
    src_qml/common_component/MaterialUI/styles/MShadow.qml
    src_qml/common_component/MaterialUI/styles/Colors.qml
    src_qml/common_component/MaterialUI/styles/TypographyStyle.qml
    src_qml/common_component/MaterialUI/styles/MPalette.qml
    src_qml/common_component/MaterialUI/Font/FontAwesomeFont.qml
    src_qml/common_component/MaterialUI/Font/IconsName.js
    src_qml/common_component/MaterialUI/StyleComponent/MFilledInputStyle.qml
    src_qml/common_component/MaterialUI/StyleComponent/MFramelessWindowButtonsMac.qml
    src_qml/common_component/MaterialUI/StyleComponent/MFramelessWindowButtonsWin.qml
    src_qml/common_component/MaterialUI/StyleComponent/MInputStyle.qml
    src_qml/common_component/MaterialUI/StyleComponent/MOutlinedInputStyle.qml
    src_qml/common_component/MaterialUI/StyleComponent/MSourceProxy.qml
    src_qml/common_component/MaterialUI/StyleComponent/MWindowResizeHandler.qml
    src_qml/common_component/MaterialUI/SvgIcon/FilledMap.js
    src_qml/common_component/MaterialUI/SvgIcon/OutlinedMap.js
    src_qml/common_component/MaterialUI/SvgIcon/RoundedMap.js
    src_qml/common_component/MaterialUI/SvgIcon/SharpMap.js
    src_qml/common_component/MaterialUI/SvgIcon/TwoToneMap.js
    src_qml/common_component/MaterialUI/MAnimation.qml
    src_qml/common_component/MaterialUI/MButton.qml
    src_qml/common_component/MaterialUI/MButtonBase.qml
    src_qml/common_component/MaterialUI/MButtonGroup.qml
    src_qml/common_component/MaterialUI/MCheckbox.qml
    src_qml/common_component/MaterialUI/MChip.qml
    src_qml/common_component/MaterialUI/MCircularProgress.qml
    src_qml/common_component/MaterialUI/MCollapse.qml
    src_qml/common_component/MaterialUI/MColorPicker.qml
    src_qml/common_component/MaterialUI/MComplexSelect.qml
    src_qml/common_component/MaterialUI/MCopyText.qml
    src_qml/common_component/MaterialUI/MDatePicker.qml
    src_qml/common_component/MaterialUI/MDateSelector.qml
    src_qml/common_component/MaterialUI/MDialog.qml
    src_qml/common_component/MaterialUI/MDirectoryButton.qml
    src_qml/common_component/MaterialUI/MDivider.qml
    src_qml/common_component/MaterialUI/MFade.qml
    src_qml/common_component/MaterialUI/MFileButton.qml
    src_qml/common_component/MaterialUI/MFilledInput.qml
    src_qml/common_component/MaterialUI/MFormControlLabel.qml
    src_qml/common_component/MaterialUI/MFramelessWindow.qml
    src_qml/common_component/MaterialUI/MGrow.qml
    src_qml/common_component/MaterialUI/MIcon.qml
    src_qml/common_component/MaterialUI/MIconButton.qml
    src_qml/common_component/MaterialUI/MInput.qml
    src_qml/common_component/MaterialUI/MInputBase.qml
    src_qml/common_component/MaterialUI/MLinearProgress.qml
    src_qml/common_component/MaterialUI/MList.qml
    src_qml/common_component/MaterialUI/MListItem.qml
    src_qml/common_component/MaterialUI/MMenu.qml
    src_qml/common_component/MaterialUI/MMenuItem.qml
    src_qml/common_component/MaterialUI/MMenuList.qml
    src_qml/common_component/MaterialUI/MOpacityMask.qml
    src_qml/common_component/MaterialUI/MOutlinedInput.qml
    src_qml/common_component/MaterialUI/MOverflowYBox.qml
    src_qml/common_component/MaterialUI/MPaper.qml
    src_qml/common_component/MaterialUI/MPopover.qml
    src_qml/common_component/MaterialUI/MRadio.qml
    src_qml/common_component/MaterialUI/MRadioGroup.qml
    src_qml/common_component/MaterialUI/MRipple.qml
    src_qml/common_component/MaterialUI/MScaleX.qml
    src_qml/common_component/MaterialUI/MScaleY.qml
    src_qml/common_component/MaterialUI/MSelect.qml
    src_qml/common_component/MaterialUI/MSelectBase.qml
    src_qml/common_component/MaterialUI/MSlide.qml
    src_qml/common_component/MaterialUI/MSlider.qml
    src_qml/common_component/MaterialUI/MSvgIcon.qml
    src_qml/common_component/MaterialUI/MSwitch.qml
    src_qml/common_component/MaterialUI/MTextField.qml
    src_qml/common_component/MaterialUI/MTimePicker.qml
    src_qml/common_component/MaterialUI/MToast.qml
    src_qml/common_component/MaterialUI/MToolTip.qml
    src_qml/common_component/MaterialUI/MTouchRipple.qml
    src_qml/common_component/MaterialUI/MTypography.qml
    src_qml/common_component/MaterialUI/MZoom.qml
    src_qml/common_component/Route/Route.qml
    src_qml/common_component/SQL/QSQL/persistence.js
    src_qml/common_component/SQL/QSQL/persistence.store.sql.js
    src_qml/common_component/SQL/QSQL/QSQL.qml
    src_qml/common_component/SQL/SQLHelper/SQLTools.qml
    src_qml/instance_component/Navbar/Navbar.qml
    src_qml/instance_component/AboutDialog/AboutDialog.qml
    src_qml/instance_component/SystemTray/SystemTray.qml
    src_qml/instance_component/SQLTable/TableFactory/qmldir
    src_qml/instance_component/SQLTable/SettingData/SettingData.qml
    src_qml/instance_component/SQLTable/TableBase/TableBase.qml
    src_qml/instance_component/SQLTable/TableFactory/TableFactory.qml
    src_qml/common_js/Color.js
    src_qml/common_js/StringUtil.js
    src_qml/common_js/Tools.js
    src_qml/common_js/ComponentConfig.js
    src_qml/pages/Api/BaseApi.qml
    src_qml/pages/Api/ButtonApi.qml
    src_qml/pages/Api/ButtonBaseApi.qml
    src_qml/pages/Api/ButtonGroupApi.qml
    src_qml/pages/Api/CheckboxApi.qml
    src_qml/pages/Api/CircularProgressApi.qml
    src_qml/pages/Api/ColorPickerApi.qml
    src_qml/pages/Api/ComplexSelectApi.qml
    src_qml/pages/Api/DatePickerApi.qml
    src_qml/pages/Api/FormControlLabelApi.qml
    src_qml/pages/Api/FramelessWindowApi.qml
    src_qml/pages/Api/IconApi.qml
    src_qml/pages/Api/LinearProgressApi.qml
    src_qml/pages/Api/PaperApi.qml
    src_qml/pages/Api/PropsTable.qml
    src_qml/pages/Api/RadioApi.qml
    src_qml/pages/Api/RadioGroupApi.qml
    src_qml/pages/Api/SelectApi.qml
    src_qml/pages/Api/SliderApi.qml
    src_qml/pages/Api/SvgIconApi.qml
    src_qml/pages/Api/SwitchApi.qml
    src_qml/pages/Api/TextFieldApi.qml
    src_qml/pages/Api/TimePicker.qml
    src_qml/pages/HomePage/HomePage.qml
    src_qml/pages/Display/ButtonPage.qml
    src_qml/pages/Display/ButtonGroupPage.qml
    src_qml/pages/Display/CheckboxPage.qml
    src_qml/pages/Display/ColoPickerPage.qml
    src_qml/pages/Display/DateTimePickerPage.qml
    src_qml/pages/Display/FontAwesomeIconPage.qml
    src_qml/pages/Display/FramelessWindowPage.qml
    src_qml/pages/Display/IconPage.qml
    src_qml/pages/Display/PaperPage.qml
    src_qml/pages/Display/ProgressPage.qml
    src_qml/pages/Display/RadioPage.qml
    src_qml/pages/Display/SelectPage.qml
    src_qml/pages/Display/SliderPage.qml
    src_qml/pages/Display/SvgIconPage.qml
    src_qml/pages/Display/SwitchPage.qml
    src_qml/pages/Display/TextFieldPage.qml
    src_qml/pages/Display/TransitionsPage.qml
)

# qmldir文件列表
set(qmldir_files
    src_qml/common_component/MaterialUI/Font/qmldir
    src_qml/common_component/MaterialUI/colors/qmldir
    src_qml/common_component/MaterialUI/styles/qmldir
    src_qml/common_component/Route/qmldir
    src_qml/common_component/SQL/QSQL/qmldir
    src_qml/common_component/SQL/SQLHelper/qmldir
    src_qml/instance_component/SQLTable/SettingData/qmldir
)

qt_add_qml_module(MaterialUI_QML_Qt6
    URI MaterialUI_QML_Qt6
    VERSION 1.0
    QML_FILES ${plain_qml_files}
    RESOURCES ${qmldir_files}
    RESOURCES src_qml/common_component/MaterialUI/Font/fa-solid-900.ttf
    RESOURCES src_qml/common_component/MaterialUI/StyleComponent/opacitymask.frag.qsb
)

# 加载资源:
set(qml_resource_files
    "src_qml/common_image/Icon/logo.png"
)

qt_add_resources(MaterialUI_QML_Qt6 "resources"
    PREFIX # 路径的前缀
        "/"
    BASE # 基础路径，例如设置为"src_qml/common_image"，那么访问"src_qml/common_image/Icon/logo.png"，应该是"qrc:/Icon/logo.png"
        ""
    FILES
        ${qml_resource_files}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(MaterialUI_QML_Qt6 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.MaterialUI_QML_Qt6
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(MaterialUI_QML_Qt6
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS MaterialUI_QML_Qt6
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
