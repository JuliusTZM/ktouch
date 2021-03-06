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
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "resource.h"

Resource::Resource(QObject* parent):
    QObject(parent),
    m_isValid(false)
{
}

QString Resource::id() const
{
    return m_id;
}

void Resource::setId(const QString& id)
{
    if (id != m_id)
    {
        m_id = id;
        emit idChanged();
    }
}

bool Resource::isValid() const
{
    return m_isValid;
}

void Resource::setIsValid(bool isValid)
{
    if (isValid != m_isValid)
    {
        m_isValid = isValid;
        emit isValidChanged();
    }
}
