#ifndef APPLICATIONEVENTFILTER_H
#define APPLICATIONEVENTFILTER_H

#include <QString>
#include <QVariant>
#include <QObject>

class ApplicationEventFilter : public QObject {
    Q_OBJECT

protected:
    bool eventFilter(QObject *obj, QEvent *event) override;

signals:
    void appEvent(QString type, QVariant data);
};

#endif // APPLICATIONEVENTFILTER_H
