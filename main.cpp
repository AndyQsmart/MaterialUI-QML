#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>
#include <QQuickStyle>
#include <QFont>
#include "src/utils/application_event_filter.h"

int main(int argc, char *argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    // 高分辨率适配
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);
#endif

    QGuiApplication app(argc, argv);
    QFont default_font;
    default_font.setFamily("Arial");
    app.setFont(default_font);
    app.setOrganizationName("AndyQsmart");
    app.setOrganizationDomain("https://github.com/AndyQsmart/MaterialUI-QML");

    QQmlApplicationEngine engine;

    // mac端无边框窗口，需要启用默认 Alpha 缓冲区
    #ifdef Q_OS_MAC
    QQuickWindow::setDefaultAlphaBuffer(true);
    #endif

    // 全局特殊事件处理
    ApplicationEventFilter *app_event_filter = new ApplicationEventFilter();
    app.installEventFilter(app_event_filter);
    engine.rootContext()->setContextProperty("AppEventFilter", app_event_filter);

    const QUrl url(QStringLiteral("qrc:/src_qml/main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
    );

    engine.load(url);

    return app.exec();
}
