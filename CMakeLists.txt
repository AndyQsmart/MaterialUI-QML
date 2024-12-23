cmake_minimum_required(VERSION 3.16)

project(MaterialUI-QML-Qt6 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)


qt_add_executable(MaterialUI_QML_Qt6
    main.cpp
)

set(plain_qml_files
    src_qml/Main.qml
    src_qml/instance_component/Navbar/Navbar.qml
    src_qml/instance_component/AboutDialog/AboutDialog.qml
    src_qml/common_component/Route/Route.qml
    src_qml/common_component/MaterialUI/Font/FontAwesomeFont.qml
    src_qml/common_component/MaterialUI/Font/IconsName.js
    src_qml/common_component/MaterialUI/styles/MShadow.qml
    src_qml/common_component/MaterialUI/MOverflowYBox.qml
    src_qml/common_component/MaterialUI/MListItem.qml
    src_qml/common_component/MaterialUI/MButton.qml
    src_qml/common_component/MaterialUI/MButtonBase.qml
    src_qml/common_component/MaterialUI/MDialog.qml
    src_qml/common_component/MaterialUI/MDirectoryButton.qml
    src_qml/common_component/MaterialUI/MFade.qml
    src_qml/common_component/MaterialUI/MFileButton.qml
    src_qml/common_component/MaterialUI/MFormControlLabel.qml
    src_qml/common_component/MaterialUI/MFramelessWindow.qml
    src_qml/common_component/MaterialUI/MGrow.qml
    src_qml/common_component/MaterialUI/MIcon.qml
    src_qml/common_component/MaterialUI/MList.qml
    src_qml/common_component/MaterialUI/MMenu.qml
    src_qml/common_component/MaterialUI/MMenuItem.qml
    src_qml/common_component/MaterialUI/MMenuList.qml
    src_qml/common_component/MaterialUI/MPaper.qml
    src_qml/common_component/MaterialUI/MPopover.qml
    src_qml/common_component/MaterialUI/MRadio.qml
    src_qml/common_component/MaterialUI/MRadioGroup.qml
    src_qml/common_component/MaterialUI/MRipple.qml
    src_qml/common_component/MaterialUI/MToast.qml
    src_qml/common_component/MaterialUI/MTouchRipple.qml
    src_qml/common_component/MaterialUI/MTypography.qml
    src_qml/common_component/MaterialUI/MAnimation.qml
    src_qml/common_component/MaterialUI/MCollapse.qml
    src_qml/common_component/MaterialUI/MCopyText.qml
    src_qml/common_component/MaterialUI/colors/Grey.qml
    src_qml/common_component/MaterialUI/colors/Indigo.qml
    src_qml/common_component/MaterialUI/colors/Pink.qml
    src_qml/common_component/MaterialUI/colors/Red.qml
    src_qml/common_component/MaterialUI/styles/Colors.qml
    src_qml/common_component/MaterialUI/styles/TypographyStyle.qml
    src_qml/common_component/MaterialUI/styles/MPalette.qml
    src_qml/common_component/MaterialUI/StyleComponent/MFramelessWindowButtonsMac.qml
    src_qml/common_component/MaterialUI/StyleComponent/MFramelessWindowButtonsWin.qml
    src_qml/common_component/MaterialUI/StyleComponent/MWindowResizeHandler.qml
    src_qml/common_js/Color.js
    src_qml/common_js/StringUtil.js
    src_qml/common_js/Tools.js
    src_qml/common_js/ComponentConfig.js
    src_qml/pages/HomePage/HomePage.qml
    src_qml/pages/Display/ButtonPage.qml
    src_qml/pages/Display/FramelessWindowPage.qml
)

qt_add_qml_module(MaterialUI_QML_Qt6
    URI MaterialUI_QML_Qt6
    VERSION 1.0
    QML_FILES ${plain_qml_files}
    RESOURCES src_qml/common_component/MaterialUI/Font/fa-solid-900.ttf
    RESOURCES src_qml/common_component/MaterialUI/Font/qmldir
    RESOURCES src_qml/common_component/MaterialUI/colors/qmldir
    RESOURCES src_qml/common_component/MaterialUI/styles/qmldir
    RESOURCES src_qml/common_component/Route/qmldir
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
