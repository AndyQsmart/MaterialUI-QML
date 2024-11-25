# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtCore import QCoreApplication, Qt
from PySide2.QtGui import QGuiApplication, QFont
from PySide2.QtQml import QQmlApplicationEngine

from src.utils.application_event_filter import ApplicationEventFilter

if __name__ == "__main__":
    # 高分辨率适配
    QCoreApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    QGuiApplication.setHighDpiScaleFactorRoundingPolicy(Qt.HighDpiScaleFactorRoundingPolicy.PassThrough)

    app = QGuiApplication(sys.argv)
    # QQuickStyle.setStyle('Material')
    defualt_font = QFont()
    defualt_font.setFamily("Arial")
    app.setFont(defualt_font)
    app.setOrganizationName('AndyQsmart')
    app.setOrganizationDomain('https://github.com/AndyQsmart/MaterialUI-QML')

    engine = QQmlApplicationEngine()

    # 全局特殊事件处理
    app_event_filter = ApplicationEventFilter()
    app.installEventFilter(app_event_filter)
    engine.rootContext().setContextProperty("AppEventFilter", app_event_filter)

    engine.load(os.path.join(os.path.dirname(__file__), "src_qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
