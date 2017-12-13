#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQuickView>
#include <QtGui/QOpenGLContext>

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QGuiApplication app(argc, argv);

  qputenv("QT3D_GLSL100_WORKAROUND", "");

  QSurfaceFormat format;
  if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
    format.setVersion(3, 2);
    format.setProfile(QSurfaceFormat::CoreProfile);
  }
  format.setDepthBufferSize(24);
  format.setStencilBufferSize(8);

  QQuickView view;
  view.setFormat(format);
  view.setResizeMode(QQuickView::SizeRootObjectToView);
  QObject::connect(view.engine(), &QQmlEngine::quit, &app,
                   &QGuiApplication::quit);
  view.setSource(QUrl("qrc:/main.qml"));
  view.show();

  //    QQmlApplicationEngine engine;
  //    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
  //    if (engine.rootObjects().isEmpty())
  //        return -1;

  return app.exec();
}
