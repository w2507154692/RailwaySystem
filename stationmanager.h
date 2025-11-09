#ifndef STATIONMANAGER_H
#define STATIONMANAGER_H
#include <QObject>
#include <vector>
#include "station.h"
#include "city.h"

class StationManager : public QObject
{
    Q_OBJECT

private:
    std::vector<Station> stations;
    std::vector<City> cities;

public:
    explicit StationManager(QObject *parent = nullptr);
    Q_INVOKABLE QStringList getCitiesName_api();
    double computeDistance(City &c1, City &c2);
    std::optional<Station> getStationByStationName(const QString &stationName);
    std::optional<City> getCityByCityName(const QString &cityName);

private:
    void readFromFileStations(const char filename[]);
    void readFromFileCities(const char filename[]);
    void readFromFile(const char filenameStations[], const char filenameCities[]);
};

#endif // STATIONMANAGER_H
