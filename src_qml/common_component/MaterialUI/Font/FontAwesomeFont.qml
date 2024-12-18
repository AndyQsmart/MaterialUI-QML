// Fonts.qml
//加载fontawesome5 otf
pragma Singleton

import QtQuick 2.15

Item {
    id: fonts

    // readonly property FontLoader fontAwesomeRegular: FontLoader {
    //     source: "./Font Awesome 5 Free-Regular-400.otf"
    // }
    readonly property FontLoader fontAwesomeSolid: FontLoader {
        source: "./fa-solid-900.ttf"
    }
    // readonly property FontLoader fontAwesomeBrands: FontLoader {
    //     source: "./Font Awesome 5 Brands-Regular-400.otf"
    // }
    //导出字体名，供外部使用
    // readonly property string icons: fonts.fontAwesomeRegular.name
    readonly property string solid: fonts.fontAwesomeSolid.name
    // readonly property string brands: fonts.fontAwesomeBrands.name
}
