-- Branch Table (for authentication)
CREATE TABLE Branch (
    BranchName NVARCHAR(100) PRIMARY KEY,
    Password NVARCHAR(255) NOT NULL
);

-- Donor Table
CREATE TABLE Donor (
    DonorId INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(255) NOT NULL,
    BloodType NVARCHAR(5) NOT NULL,
    Town NVARCHAR(100) NOT NULL,
    City NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(15) NOT NULL UNIQUE,
    Photo VARBINARY(MAX),
    BranchName NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Donor_Branch FOREIGN KEY (BranchName) REFERENCES Branch(BranchName)
);

-- BloodBank Table
CREATE TABLE BloodBank (
    BloodBankId INT PRIMARY KEY IDENTITY(1,1),
    BranchName NVARCHAR(100) NOT NULL,
    BloodQuantity INT NOT NULL,
    CONSTRAINT FK_BloodBank_Branch FOREIGN KEY (BranchName) REFERENCES Branch(BranchName)
);

-- BloodRequest Table
CREATE TABLE BloodRequest (
    BloodRequestId INT PRIMARY KEY IDENTITY(1,1),
    Hospital NVARCHAR(255) NOT NULL,
    City NVARCHAR(100) NOT NULL,
    Town NVARCHAR(100) NOT NULL,
    BloodType NVARCHAR(5) NOT NULL,
    Units INT NOT NULL,
    ContactEmail NVARCHAR(255) NOT NULL,
    IsFulfilled BIT DEFAULT 0,
    DonorId INT,
    CONSTRAINT CK_Units CHECK (Units > 0),
    CONSTRAINT FK_BloodRequest_Donor FOREIGN KEY (DonorId) REFERENCES Donor(DonorId)
);


INSERT INTO Branch (BranchName, Password) VALUES
('IstanbulBranch1', 'IstanbulPassword1'),
('IstanbulBranch2', 'IstanbulPassword2'),
('AnkaraBranch1', 'AnkaraPassword1'),
('AnkaraBranch2', 'AnkaraPassword2'),
('IzmirBranch1', 'IzmirPassword1'),
('IzmirBranch2', 'IzmirPassword2'),
('AntalyaBranch', 'AntalyaPassword'),
('BursaBranch', 'BursaPassword'),
('TrabzonBranch', 'TrabzonPassword'),
('AdanaBranch', 'AdanaPassword');


INSERT INTO Donor (FullName, BloodType, Town, City, PhoneNumber, Photo, BranchName) VALUES
('Ahmet Kaya', 'AB+', 'Üsküdar', 'Istanbul', '5551112233', NULL, 'IstanbulBranch'),
('Fatma Öztürk', 'A-', 'Etimesgut', 'Ankara', '5552223344', NULL, 'AnkaraBranch'),
('Cemil Yildirim', 'O+', 'Bornova', 'Izmir', '5553334455', NULL, 'IzmirBranch'),
('Zeynep Erdoğan', 'B+', 'Beşiktaş', 'Istanbul', '5554445566', NULL, 'IstanbulBranch'),
('Tayyar Aksoy', 'AB-', 'Keçiören', 'Ankara', '5555556677', NULL, 'AnkaraBranch'),
('Leyla Çelik', 'A+', 'Buca', 'Izmir', '5556667788', NULL, 'IzmirBranch'),
('Canan Yilmaz', 'O-', 'Ümraniye', 'Istanbul', '5557778899', NULL, 'IstanbulBranch'),
('Serkan Şahin', 'B-', 'Sincan', 'Ankara', '5558889900', NULL, 'AnkaraBranch'),
('Sibel Demirtaş', 'AB+', 'Karsiyaka', 'Izmir', '5559990011', NULL, 'IzmirBranch'),
('Deniz Erkan', 'A-', 'Kadiköy', 'Istanbul', '5550001122', NULL, 'IstanbulBranch');


INSERT INTO BloodBank (BranchName, BloodQuantity) VALUES
('IstanbulBranch', 120),
('AnkaraBranch', 80),
('IzmirBranch', 200),
('IstanbulBranch', 90),
('AnkaraBranch', 110),
('IzmirBranch', 150),
('IstanbulBranch', 130),
('AnkaraBranch', 100),
('IzmirBranch', 180),
('IstanbulBranch', 80);

INSERT INTO BloodRequest (Hospital, City, Town, BloodType, Units, ContactEmail, IsFulfilled, DonorId) VALUES
('Memorial Hospital', 'Istanbul', 'Üsküdar', 'AB+', 2, 'memorial@example.com', 1, 1),
('GATA Hospital', 'Ankara', 'Etimesgut', 'A-', 3, 'gata@example.com', 0, NULL),
('Ege Medical Center', 'Izmir', 'Bornova', 'O+', 1, 'ege@example.com', 1, 3),
('Acibadem Hospital', 'Istanbul', 'Beşiktaş', 'B+', 2, 'acibadem@example.com', 0, NULL),
('Atatürk Hospital', 'Ankara', 'Keçiören', 'AB-', 4, 'atatürk@example.com', 1, 5),
('İzmir City Hospital', 'Izmir', 'Buca', 'A+', 3, 'izmir@example.com', 0, NULL),
('Medipol Hospital', 'Istanbul', 'Ümraniye', 'O-', 2, 'medipol@example.com', 1, 7),
('Ankara City Hospital', 'Ankara', 'Sincan', 'B-', 1, 'ankara@example.com', 0, NULL),
('Tepecik Hospital', 'Izmir', 'Karsiyaka', 'AB+', 4, 'tepecik@example.com', 1, 9),
('Haydarpaşa Hospital', 'Istanbul', 'Kadiköy', 'A-', 2, 'haydarpasa@example.com', 0, NULL);
