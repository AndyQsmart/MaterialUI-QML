import platform
from PySide6.QtCore import Qt, QObject, Signal, QEvent
from PySide6.QtWidgets import QApplication

class ApplicationEventFilter(QObject):
    appEvent = Signal(str, 'QVariant')

    def eventFilter(self, obj: QObject, event: QEvent):
        event_type = event.type()

        if platform.system() == 'Darwin':
            if event_type == QEvent.ApplicationStateChange:
                state = QApplication.instance().applicationState()
                if state == Qt.ApplicationActive:
                    self.appEvent.emit("MAC_ApplicationActive", {})
            elif event_type == QEvent.Quit:
                state = QApplication.instance().applicationState()
                self.appEvent.emit("MAC_Quit", {})

        return super().eventFilter(obj, event)
