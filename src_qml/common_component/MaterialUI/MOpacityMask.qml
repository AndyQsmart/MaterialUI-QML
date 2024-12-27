// Copyright (C) 2020 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

import QtQuick
import "./StyleComponent"

Item {
    id: root

    property variant source
    property variant maskSource
    property bool cached: false

    MSourceProxy {
        id: sourceProxy
        input: root.source
    }

    MSourceProxy {
        id: maskSourceProxy
        input: root.maskSource
    }

    ShaderEffectSource {
        id: cacheItem
        anchors.fill: parent
        visible: root.cached
        smooth: true
        sourceItem: shaderItem
        live: true
        hideSource: visible
    }

    ShaderEffect {
        id: shaderItem
        property variant source: sourceProxy.output
        property variant maskSource: maskSourceProxy.output

        anchors.fill: parent

        fragmentShader: "./StyleComponent/opacitymask.frag.qsb"
    }
}
