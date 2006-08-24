/***************************************************************************
 *   ktouchstatus.cpp                                                      *
 *   ----------------                                                      *
 *   Copyright (C) 2000 by Håvard Frøiland, 2004 by Andreas Nicolai        *
 *   ghorwin@users.sourceforge.net                                         *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 ***************************************************************************/

#include "ktouchstatus.h"
#include "ktouchstatus.moc"

#include <qlcdnumber.h>
#include <qlabel.h>
#include <q3progressbar.h>
#include <kdebug.h>

KTouchStatus::KTouchStatus(QWidget *parent)
 : QWidget(parent)
{
    setupUi(this);
}

void KTouchStatus::setNewChars(const QString& newChars) {
    newCharsLabel->setText(newChars);
}

void KTouchStatus::updateStatus(unsigned int level, double correctness) {
    levelLCD->display(static_cast<int>(level)+1); // +1 because our level variable ranges from 0...n-1
    correctnessBar->setProgress(static_cast<int>(correctness*100) );
}
