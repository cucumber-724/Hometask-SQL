CREATE TABLE Жанры (
    Id_Жанра SERIAL PRIMARY KEY,
    Название_жанра VARCHAR(100) NOT NULL
);

CREATE TABLE Исполнители (
    Id_Исполнителя SERIAL PRIMARY KEY,
    Имя_исполнителя VARCHAR(100) NOT NULL
);

CREATE TABLE ИсполнителиЖанры (
    Id_Исполнителя INT REFERENCES Исполнители(Id_Исполнителя),
    Id_Жанра INT REFERENCES Жанры(Id_Жанра),
    PRIMARY KEY (Id_Исполнителя, Id_Жанра)
);

CREATE TABLE Альбомы (
    Id_Альбома SERIAL PRIMARY KEY,
    Название_альбома VARCHAR(100) NOT NULL,
    Год_выпуска INT NOT NULL
);

CREATE TABLE АльбомыИсполнители (
    Id_Альбома INT REFERENCES Альбомы(Id_Альбома),
    Id_Исполнителя INT REFERENCES Исполнители(Id_Исполнителя),
    PRIMARY KEY (Id_Альбома, Id_Исполнителя)
);

CREATE TABLE Треки (
    Id_Трека SERIAL PRIMARY KEY,
    Название_трека VARCHAR(100) NOT NULL,
    Длительность_трека INTERVAL NOT NULL,
    Id_Альбома INT REFERENCES Альбомы(Id_Альбома) NOT NULL
);

CREATE TABLE Сборники (
    Id_Сборника SERIAL PRIMARY KEY,
    Название_сборника VARCHAR(100) NOT NULL,
    Год_выпуска INT NOT NULL
);

CREATE TABLE СборникиТреки (
    Id_Сборника INT REFERENCES Сборники(Id_Сборника),
    Id_Трека INT REFERENCES Треки(Id_Трека),
    PRIMARY KEY (Id_Сборника, Id_Трека)
);

