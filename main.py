# This Python file uses the following encoding: utf-8
import sys
import os
import platform

from PySide6.QtCore import QCoreApplication, Qt
from PySide6.QtGui import QGuiApplication, QFont
from PySide6.QtQuick import QQuickWindow
from PySide6.QtQml import QQmlApplicationEngine

from src.utils.application_event_filter import ApplicationEventFilter

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    # QQuickStyle.setStyle('Material')
    defualt_font = QFont()
    defualt_font.setFamily("Arial")
    app.setFont(defualt_font)
    app.setOrganizationName('AndyQsmart')
    app.setOrganizationDomain('https://github.com/AndyQsmart/MaterialUI-QML-Qt6')

    engine = QQmlApplicationEngine()

    # 全局特殊事件处理
    app_event_filter = ApplicationEventFilter()
    app.installEventFilter(app_event_filter)
    engine.rootContext().setContextProperty("AppEventFilter", app_event_filter)

    engine.load(os.path.join(os.path.dirname(__file__), "src_qml/Main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
