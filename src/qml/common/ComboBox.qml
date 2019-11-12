/*
 *  Copyright 2017  Sebastian Gottfried <sebastian.gottfried@posteo.de>
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License as
 *  published by the Free Software Foundation; either version 2 of
 *  the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import ktouch 1.0

ComboBox {
    id: control

    property string iconRole: "icon"

    property KColorScheme colorScheme: KColorScheme {
        colorGroup: control.enabled? KColorScheme.Active: KColorScheme.Inactive
        colorSet: KColorScheme.Button
    }

    property alias popupListView: list

    KColorScheme {
        id: listColorScheme
        colorGroup: KColorScheme.Active
        colorSet: KColorScheme.View
    }

    hoverEnabled: true
    spacing: 0.7 * font.pixelSize

    background: Item {
        Rectangle {
            anchors.fill: parent
            opacity: (popup.visible? 0.6: 0.0) + (control.hovered || control.visualFocus? 0.3: 0.0)
            color: colorScheme.normalBackground
            Behavior on opacity {
                NumberAnimation {
                    duration: 150
                }
            }
        }

        FocusBar {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            height: 3
            control: control
        }
    }

    contentItem: IconLabel {
        text: control.displayText
        iconName: currentIndex != -1 && currentIndex < model.count ? control.model.get(currentIndex)[control.iconRole]: ""
        color: colorScheme.normalText
    }

    indicator: MonochromeIcon {
        color: colorScheme.normalText
        icon: "arrow-down-double"
        x: control.width - width - control.contentItem.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        rotation: control.popup.opacity * -180
    }

    delegate: ListItem {
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        iconName: control.iconRole ? (Array.isArray(control.model) ? modelData[control.iconRole] : model[control.iconRole]) : ""
        highlighted: control.currentIndex === index
    }

    popup: Popup {
        y: control.height
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 0
        opacity: 0

        enter: Transition {
            NumberAnimation {
                property: "opacity"
                to: 1.0
                duration: 150
            }
        }

        exit: Transition {
            NumberAnimation {
                property: "opacity"
                to: 0.0
                duration: 150
            }
        }

        contentItem:
            ListView {
                id: list
                clip: true
                implicitHeight: contentHeight
                width: parent.width
                model: control.popup.visible ? control.delegateModel : null
                currentIndex: control.highlightedIndex
            }

        background: Rectangle {
            color: listColorScheme.normalBackground
            layer.enabled: true
            layer.effect: DropShadow {
                samples: 24
                horizontalOffset: 0
                verticalOffset: 0
            }
        }
    }
}
