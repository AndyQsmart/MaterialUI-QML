import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../common_component/MaterialUI"
import "../../common_js/StringUtil.js" as Strings
import "../../common_js/Color.js" as Color

MDialog {
    id: aboutPopup
    width: 600
    height: 200
    padding: 20
    transitionComponent: MFade {}

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            spacing: 0

            MTypography {
                variant: 'h6'
                text: qsTr("关于")
                Layout.fillWidth: true
            }

            MouseArea {
                width: 32
                height: 32
                cursorShape: Qt.PointingHandCursor

                MIcon {
                    name: 'close'
                    size: 20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                onClicked: {
                    aboutDialog.close()
                }
            }
        }

        RowLayout {
            Layout.topMargin: 20
            Layout.fillWidth: true
            Layout.fillHeight: true

            MTypography {
                wrapMode: Text.WrapAnywhere
                text: qsTr('MaterialUI库')
            }
        }

        MTypography {
            topPadding: 10
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignRight
            text: qsTr('版本号：ver'+Strings.VERSION)
            textColor: 'textSecondary'
            variant: 'caption'
        }

        MTypography {
            topPadding: 10
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignRight
            text: qsTr('Copyright © 2023')
            textColor: 'textSecondary'
            variant: 'caption'
        }
    }
}
