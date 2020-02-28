/*
 *  Copyright 2013  Sebastian Gottfried <sebastiangottfried@web.de>
 *  Copyright 2015  Sebastian Gottfried <sebastiangottfried@web.de>
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

Item {

    id: root

    property alias content: contentArea.data
    property alias color: background.color

    width: contentArea.width + Units.largeSpacing
    height: contentArea.height + Units.largeSpacing


    Rectangle {
        anchors.fill: parent
        id: background
        color: activePalette.mid
        opacity: 0.7
        radius: Units.smallSpacing

        SystemPalette {
            id: activePalette
            colorGroup: SystemPalette.Active
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: Units.shortDuration }
    }

    Row {
        id: contentArea
        anchors.centerIn: parent
        height: childrenRect.height
        spacing: Units.smallSpacing
    }
}
