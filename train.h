#ifndef TRAIN_H
#define TRAIN_H
#include <QString>
#include "timetable.h"
#include <vector>
#include <tuple>

class Train
{
private:
    QString number;
    Timetable timetable;
    std::vector<std::tuple<QString, int, int>> carriages;

public:
    Train();

    QString getNumber() const;
    Timetable getTimetable() const;
    std::vector<std::tuple<QString, int, int>> getCarriages() const;
    int getFirstClassCount();
    int getSecondClassCount();
    int getBusinessClassCount();

    friend bool operator==(const Train &t1, const Train &t2);
    friend bool operator!=(const Train &t1, const Train &t2);

    friend std::istream &operator>>(std::istream &is, Train &train);
    friend std::ostream &operator<<(std::ostream &os, const Train &train);
};

#endif // TRAIN_H
