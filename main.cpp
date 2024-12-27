#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFont>
#include "src/utils/application_event_filter.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QFont default_font;
    default_font.setFamily("Arial");
    app.setFont(default_font);
    app.setOrganizationName("AndyQsmart");
    app.setOrganizationDomain("https://github.com/AndyQsmart/MaterialUI-QML-Qt6");

    QQmlApplicationEngine engine;

    // 全局特殊事件处理
    ApplicationEventFilter *app_event_filter = new ApplicationEventFilter();
    app.installEventFilter(app_event_filter);
    engine.rootContext()->setContextProperty("AppEventFilter", app_event_filter);

    const QUrl url(QStringLiteral("qrc:/MaterialUI_QML_Qt6/src_qml/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
    );

    engine.load(url);

    return app.exec();
}
