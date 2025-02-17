# MaterialUI-QML
This is a material ui written by Qt QML

[Material Design](https://m1.material.io/) is a specification for a unified system of visual, motion, and interaction design that adapts across different devices.

I try to deliver a set of QML UI components that implement the material design specification for use in Qt QML applications.

# Qt version
This branch is written for Qt5(PySide2). You can use the branch for [Qt6(PySide6)](https://github.com/AndyQsmart/MaterialUI-QML/tree/Qt6).

# Usage
Import package in your project
```
import "./common_component/MaterialUI"
```
In this case,I place "Material UI" in folder "common_component".You can move the "Material UI" to anywhere you want.

# Example
You can run the example project.It is an example that show some usage of components.

1. run in C++
   - Qt 5.15.2
   - Set `QQuickWindow::setDefaultAlphaBuffer(true);` if use `MFramelessWindow` in mac.

2. run in Python
   - Python 3.9
   - pip install PySide2==5.15.2.1
   - Set `QQuickWindow.setDefaultAlphaBuffer(True)` if use `MFramelessWindow` in mac.
   - `python main.py`

![image](https://github.com/AndyQsmart/MaterialUI-QML/blob/main/readme_image/image1.jpg)
![image](https://github.com/AndyQsmart/MaterialUI-QML/blob/main/readme_image/image2.jpg)

# Components (until now)
```
MAnimation.qml
MButton.qml
MButtonBase.qml
MButtonGroup.qml
MCheckbox.qml
MChip.qml
MCircularProgress.qml
MCollapse.qml
MColorPicker.qml
MComplexSelect.qml
MCopyText.qml
MDatePicker.qml
MDateSelector.qml
MDialog.qml
MDirectoryButton.qml
MDivider.qml
MFade.qml
MFileButton.qml
MFormControlLabel.qml
MGrow.qml
MIcon.qml
MIconButton.qml
MLinearProgress.qml
MList.qml
MListItem.qml
MMenu.qml
MMenuItem.qml
MMenuList.qml
MOverflowYBox.qml
MPaper.qml
MPopover.qml
MRadio.qml
MRadioGroup.qml
MSelect.qml
MSelectBase.qml
MSlide.qml
MSlider.qml
MSvgIcon.qml
MSwitch.qml
MTextField.qml
MTimePicker.qml
MToast.qml
MToolTip.qml
MTypography.qml
MZoom.qml
```
