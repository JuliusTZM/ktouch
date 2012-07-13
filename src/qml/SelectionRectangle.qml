/*
 *  Copyright 2012  Sebastian Gottfried <sebastiangottfried@web.de>
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
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 1.1
import ktouch 1.0

Item
{
    id: root;

    property bool interactive: true

    Rectangle {
        anchors.centerIn: parent
        width: parent.width - 5
        height: parent.height - 5
        color: "transparent"
        border {
            color: "#000";
            width: 1
        }
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "left"
        verticalPosition: "top"
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "left"
        verticalPosition: "center"
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "left"
        verticalPosition: "bottom"
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "center"
        verticalPosition: "top"
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "center"
        verticalPosition: "bottom"
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "right"
        verticalPosition: "top"
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "right"
        verticalPosition: "center"
    }

    SelectionGrip {
        interactive: root.interactive
        horizontalPosition: "right"
        verticalPosition: "bottom"
    }
}
