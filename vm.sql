-- Create Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('regular', 'curator', 'admin') NOT NULL
);

-- Create Artifacts table
CREATE TABLE Artifacts (
    ArtifactID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Dimensions VARCHAR(50),
    AcquisitionDate DATE,
    Provenance TEXT,
    CulturalSignificance TEXT
);


-- Create Curators table with a foreign key referencing Users table
CREATE TABLE Curators (
    CuratorID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,  -- Foreign key referencing UserID in Users table
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255),
    Country VARCHAR(50),  
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


-- Create Exhibits table
CREATE TABLE Exhibits (
    ExhibitID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    CuratorID INT,
    Layout VARCHAR(255),
    VirtualTour VARCHAR(255),
    EducationalMaterials VARCHAR(255),
    FOREIGN KEY (CuratorID) REFERENCES Curators(CuratorID)
);

-- Create Artists table
CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Lifespan VARCHAR(50),
    Nationality VARCHAR(50),
    Biography TEXT,
    RelevantArtifacts VARCHAR(255)
);



-- Create Periods/Movements table
CREATE TABLE PeriodsMovements (
    PeriodMovementID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT
);

-- Create Locations table
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8)
);

-- Create Donations table
CREATE TABLE Donations (
    DonationID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    DonationDate DATE,
    Purpose VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Events table
CREATE TABLE Events (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    DateTime DATETIME,
    LocationID INT,
    Organizer VARCHAR(100),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

-- Create Interactions table
CREATE TABLE Interactions (
    InteractionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ArtifactID INT,
    InteractionType ENUM('like', 'favorite', 'comment') NOT NULL,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ArtifactID) REFERENCES Artifacts(ArtifactID)
);

-- Create EducationalResources table
CREATE TABLE EducationalResources (
    ResourceID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Content VARCHAR(255),
    ResourceType ENUM('text', 'audio', 'video') NOT NULL,
    RelatedArtifacts VARCHAR(255)
);

-- Create FeedbackSurveys table
CREATE TABLE FeedbackSurveys (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    FeedbackType ENUM('general', 'survey') NOT NULL,
    Message TEXT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- insert data into user table
-- Inserting 50 rows into the Users table with Muslim and Hindu names and gmail.com domain
INSERT INTO Users (Username, Email, Password, Role) VALUES
('Muhammad', 'muhammad@gmail.com', 'muhammad123', 'regular'),
('Fatima', 'fatima@gmail.com', 'fatima456', 'regular'),
('Ahmed', 'ahmed@gmail.com', 'ahmed789', 'regular'),
('Aisha', 'aisha@gmail.com', 'aisha101', 'regular'),
('Ali', 'ali@gmail.com', 'ali2022', 'regular'),
('Zainab', 'zainab@gmail.com', 'zainab303', 'regular'),
('Hassan', 'hassan@gmail.com', 'hassan404', 'regular'),
('Amina', 'amina@gmail.com', 'amina505', 'regular'),
('Yusuf', 'yusuf@gmail.com', 'yusuf606', 'regular'),
('Mariam', 'mariam@gmail.com', 'mariam707', 'regular'),
('Krishna', 'krishna@gmail.com', 'krishna808', 'curator'),
('Ravi', 'ravi@gmail.com', 'ravi909', 'curator'),
('Sita', 'sita@gmail.com', 'sita010', 'curator'),
('Ganesha', 'ganesha@gmail.com', 'ganesha111', 'curator'),
('Vishnu', 'vishnu@gmail.com', 'vishnu212', 'curator'),
('Shiva', 'shiva@gmail.com', 'shiva313', 'curator'),
('Parvati', 'parvati@gmail.com', 'parvati414', 'curator'),
('Omar', 'omar@gmail.com', 'omar515', 'curator'),
('Hajar', 'hajar@gmail.com', 'hajar616', 'curator'),
('Abdullah', 'abdullah@gmail.com', 'abdullah717', 'admin'),
('Aisha2', 'aisha2@gmail.com', 'aisha222', 'admin'),
('Abu Bakr', 'abubakr@gmail.com', 'abubakr333', 'admin'),
('Ayesha', 'ayesha@gmail.com', 'ayesha444', 'admin'),
('Yahya', 'yahya@gmail.com', 'yahya555', 'admin'),
('Sumayyah', 'sumayyah@gmail.com', 'sumayyah666', 'admin'),
('Amir', 'amir@gmail.com', 'amir777', 'admin'),
('Amina2', 'amina2@gmail.com', 'amina888', 'admin'),
('Umar', 'umar@gmail.com', 'umar999', 'admin'),
('Khalid', 'khalid@gmail.com', 'khalid1010', 'admin'),
('Fawzia', 'fawzia@gmail.com', 'fawzia1111', 'regular'),
('Bilal', 'bilal@gmail.com', 'bilal1212', 'regular'),
('Jamal', 'jamal@gmail.com', 'jamal1313', 'regular'),
('Ayesha3', 'ayesha3@gmail.com', 'ayesha313', 'regular'),
('Saad', 'saad@gmail.com', 'saad1414', 'regular'),
('Imran', 'imran@gmail.com', 'imran1515', 'regular'),
('Yasir', 'yasir@gmail.com', 'yasir1616', 'regular'),
('Rabia', 'rabia@gmail.com', 'rabia1717', 'regular'),
('Safiya', 'safiya@gmail.com', 'safiya1818', 'regular'),
('Hanan', 'hanan@gmail.com', 'hanan1919', 'curator'),
('Naima', 'naima@gmail.com', 'naima2020', 'curator'),
('Karim', 'karim@gmail.com', 'karim2121', 'curator'),
('Nasir', 'nasir@gmail.com', 'nasir2222', 'curator'),
('Zakariya', 'zakariya@gmail.com', 'zakariya2323', 'curator'),
('Amina3', 'amina3@gmail.com', 'amina2424', 'curator'),
('Saeed', 'saeed@gmail.com', 'saeed2525', 'curator'),
('Munira', 'munira@gmail.com', 'munira2626', 'curator'),
('Zahra2', 'zahra2@gmail.com', 'zahra2727', 'curator'),
('Aziz', 'aziz@gmail.com', 'aziz5353', 'regular'),
('Fatimah', 'fatimah@gmail.com', 'fatimah5454', 'regular'),
('Ameena', 'ameena@gmail.com', 'ameena5555', 'regular'),
('Jalal', 'jalal@gmail.com', 'jalal5656', 'regular'),
('Soraya', 'soraya@gmail.com', 'soraya5757', 'regular'),
('Yasin', 'yasin@gmail.com', 'yasin5858', 'regular'),
('Munir', 'munir@gmail.com', 'munir5959', 'regular'),
('Zaynab', 'zaynab@gmail.com', 'zaynab6060', 'regular'),
('Farid', 'farid@gmail.com', 'farid6161', 'regular'),
('Sakina', 'sakina@gmail.com', 'sakina6262', 'regular'),
('Krish', 'krish@gmail.com', 'krish6363', 'curator'),
('Rajesh', 'rajesh@gmail.com', 'rajesh6464', 'curator'),
('Leela', 'leela@gmail.com', 'leela6565', 'curator'),
('Vivek', 'vivek@gmail.com', 'vivek6666', 'curator'),
('Neha', 'neha@gmail.com', 'neha6767', 'curator'),
('Shakti', 'shakti@gmail.com', 'shakti6868', 'curator'),
('Priti', 'priti@gmail.com', 'priti6969', 'curator'),
('Jaya', 'jaya@gmail.com', 'jaya7070', 'curator'),
('Suresh', 'suresh@gmail.com', 'suresh7171', 'curator'),
('Karan', 'karan@gmail.com', 'karan7272', 'curator'),
('Aarav', 'aarav@gmail.com', 'aarav7373', 'curator'),
('Prakash', 'prakash@gmail.com', 'prakash7474', 'curator'),
('Anita', 'anita@gmail.com', 'anita7575', 'curator'),
('Alok', 'alok@gmail.com', 'alok7676', 'curator'),
('Indira', 'indira@gmail.com', 'indira7777', 'curator'),
('Govind', 'govind@gmail.com', 'govind7878', 'curator'),
('Maya', 'maya@gmail.com', 'maya7979', 'curator'),
('Sudhir', 'sudhir@gmail.com', 'sudhir8080', 'curator'),
('Anjali', 'anjali@gmail.com', 'anjali8181', 'curator'),
('Priya', 'priya@gmail.com', 'priya8282', 'curator'),
('Rohan', 'rohan@gmail.com', 'rohan8383', 'curator'),
('Vijay', 'vijay@gmail.com', 'vijay8484', 'curator'),
('Anand', 'anand@gmail.com', 'anand8585', 'curator'),
('Geeta', 'geeta@gmail.com', 'geeta8686', 'curator'),
('Lalita', 'lalita@gmail.com', 'lalita8787', 'curator'),
('Rishi', 'rishi@gmail.com', 'rishi8888', 'curator'),
('Kamala', 'kamala@gmail.com', 'kamala8989', 'curator'),
('Nisha', 'nisha@gmail.com', 'nisha9090', 'curator'),
('Sanjay', 'sanjay@gmail.com', 'sanjay9191', 'curator'),
('Shanti', 'shanti@gmail.com', 'shanti9292', 'curator'),
('Gopal', 'gopal@gmail.com', 'gopal9393', 'curator'),
('Manish', 'manish@gmail.com', 'manish9494', 'curator'),
('Anupam', 'anupam@gmail.com', 'anupam9595', 'curator'),
('Arjun', 'arjun@gmail.com', 'arjun9696', 'curator'),
('Sushma', 'sushma@gmail.com', 'sushma9797', 'curator'),
('Radha', 'radha@gmail.com', 'radha9898', 'curator'),
('Aditya', 'aditya@gmail.com', 'aditya9999', 'curator'),
('Jatin', 'jatin@gmail.com', 'jatin1010', 'curator'),
('Nandita', 'nandita@gmail.com', 'nandita1111', 'curator'),
('Pradeep', 'pradeep@gmail.com', 'pradeep1212', 'curator'),
('Ananya', 'ananya@gmail.com', 'ananya1313', 'curator'),
('Vikram', 'vikram@gmail.com', 'vikram1414', 'curator'),
('Arvind', 'arvind@gmail.com', 'arvind1515', 'curator'),
('Arun', 'arun@gmail.com', 'arun1616', 'curator'),
('Manisha', 'manisha@gmail.com', 'manisha1717', 'curator'),
('Rohit', 'rohit@gmail.com', 'rohit1818', 'curator'),
('Anil', 'anil@gmail.com', 'anil1919', 'curator'),
('Aruna', 'aruna@gmail.com', 'aruna2020', 'curator'),
('Sunita', 'sunita@gmail.com', 'sunita2121', 'curator'),
('Praveen', 'praveen@gmail.com', 'praveen2222', 'curator'),
('Anushka', 'anushka@gmail.com', 'anushka2323', 'curator'),
('Rajeev', 'rajeev@gmail.com', 'rajeev2424', 'curator'),
('Neelam', 'neelam@gmail.com', 'neelam2525', 'curator'),
('Kavita', 'kavita@gmail.com', 'kavita2626', 'curator'),
('Akshay', 'akshay@gmail.com', 'akshay2727', 'curator'),
('Priyanka', 'priyanka@gmail.com', 'priyanka2828', 'curator'),
('Varun', 'varun@gmail.com', 'varun2929', 'curator');


-- insert data into artifacts tabele

INSERT INTO Artifacts (Name, Description, Dimensions, AcquisitionDate, Provenance, CulturalSignificance) VALUES
('Ancient Vase', 'An ancient ceramic vase depicting historical scenes.', '10x10x20 cm', '200-01-01', 'Excavated from a historical site in Greece.', 'Represents the artistry and culture of ancient Greece.'),
('Islamic Manuscript', 'A beautifully illuminated Quranic manuscript.', '20x30 cm', '1200-01-01', 'Donated by a collector of Islamic artifacts.', 'Illustrates the calligraphy and art of Islamic manuscripts.'),
('Renaissance Painting', 'A classic Renaissance painting depicting biblical scenes.', '60x80 cm', '1500-01-01', 'Purchased from an art auction.', 'Exemplifies the artistic style and themes of the Renaissance period.'),
('Mughal Jewelry', 'Exquisite jewelry pieces from the Mughal era.', 'Various sizes', '1600-01-01', 'Acquired from a private collection.', 'Showcases the craftsmanship and luxury of Mughal jewelry.'),
('Egyptian Sculpture', 'A small-scale sculpture from ancient Egypt.', '15x30x10 cm', '2500-01-01', 'Acquired during an archaeological expedition.', 'Reflects the religious and artistic traditions of ancient Egypt.'),
('Japanese Samurai Armor', 'Authentic samurai armor from feudal Japan.', 'Various sizes', '1600-01-01', 'Donated by a history enthusiast.', 'Symbolizes the warrior culture and craftsmanship of samurai.'),
('Mayan Pottery', 'Ancient Mayan pottery with intricate designs.', '10x15x10 cm', '1000-01-01', 'Recovered from a Mayan archaeological site.', 'Illustrates the artistic and cultural heritage of the Mayan civilization.'),
('European Tapestry', 'A large tapestry depicting medieval European life.', '150x200 cm', '1300-01-01', 'Donated by a museum patron.', 'Showcases the art of weaving and storytelling in medieval Europe.'),
('Chinese Scroll Painting', 'A traditional Chinese scroll painting with landscape motifs.', '30x150 cm', '1700-01-01', 'Acquired from a Chinese art dealer.', 'Exemplifies the ink painting techniques and artistic themes of China.'),
('Native American Pottery', 'Handcrafted pottery from Native American tribes.', 'Various sizes', '1800-01-01', 'Donated by a Native American cultural center.', 'Represents the artistic traditions and symbolism of Native American pottery.'),
('Greek Amphora', 'A large ancient Greek amphora used for storing wine.', '40x60 cm', '0400-01-01', 'Recovered from a shipwreck in the Mediterranean.', 'Represents ancient Greek trade and craftsmanship.'),
('Roman Statue', 'A marble statue depicting a Roman emperor.', '120 cm height', '0100-01-01', 'Acquired from an archaeological dig in Rome.', 'Reflects Roman art and political symbolism.'),
('Medieval Manuscript', 'A medieval illuminated manuscript with intricate illustrations.', '25x35 cm', '1300-01-01', 'Donated by a medieval art collector.', 'Shows the artistry and religious themes of the Middle Ages.'),
('Aztec Pottery', 'Colorful pottery pieces from the Aztec civilization.', 'Various sizes', '1400-01-01', 'Recovered from an Aztec archaeological site.', 'Illustrates Aztec artistic techniques and cultural symbols.'),
('Egyptian Hieroglyphics', 'Ancient Egyptian hieroglyphic inscriptions on a stone slab.', '50x70 cm', '1500-01-01', 'Excavated from a tomb in Egypt.', 'Provides insights into ancient Egyptian writing and history.'),
('Viking Weaponry', 'Authentic Viking weapons including swords and shields.', 'Various sizes', '0900-01-01', 'Recovered from Viking burial sites.', 'Represents Viking martial culture and craftsmanship.'),
('Renaissance Sculpture', 'A marble sculpture depicting a Renaissance figure.', '80 cm height', '1600-01-01', 'Acquired from an art auction.', 'Exemplifies Renaissance sculpture techniques and aesthetics.'),
('Japanese Tea Set', 'A traditional Japanese tea set with porcelain cups and teapot.', 'Various sizes', '1700-01-01', 'Donated by a Japanese tea enthusiast.', 'Represents Japanese tea culture and craftsmanship.'),
('Indian Miniature Painting', 'A delicate miniature painting from India with intricate details.', '10x15 cm', '1800-01-01', 'Acquired from an Indian art collector.', 'Showcases Indian miniature painting techniques and cultural themes.'),
('Ancient Mesopotamian Tablet', 'A cuneiform-inscribed clay tablet from Mesopotamia.', '20x30 cm', '2500-01-01', 'Excavated from a Mesopotamian archaeological site.', 'Provides historical records and insights into ancient Mesopotamian civilization.'),
('Ancient Vase', 'An ancient ceramic vase with intricate designs.', '20x20x30 cm', '2022-01-01', 'Archaeological site in Greece', 'Significant for studying ancient pottery techniques.'),
('Golden Mask', 'A gold mask believed to be from a royal tomb.', '15x10 cm', '1980-05-12', 'Egyptian burial site', 'Symbol of ancient Egyptian royalty.'),
('Stone Axe', 'A stone tool used by early humans for hunting and crafting.', '30x10 cm', '1701-10-08', 'Excavated from a prehistoric settlement', 'Early human technological advancement.'),
('Portrait Painting', 'A portrait of a nobleman from the Renaissance era.', '50x70 cm', '1500-06-15', 'European art collection', 'Representative of Renaissance portraiture.'),
('Mayan Glyphs', 'Stone tablets with Mayan hieroglyphs.', '40x30 cm', '1701-08-03', 'Mayan archaeological site', 'Important for understanding Mayan language and culture.'),
('Samurai Armor', 'Traditional armor worn by Japanese samurai.', 'Various sizes', '1600-04-20', 'Japanese historical collection', 'Symbol of samurai warrior tradition.'),
('Roman Coin', 'An ancient Roman coin depicting a Roman emperor.', '2 cm diameter', '1900-10-09', 'Excavated Roman city', 'Historical artifact of Roman civilization.'),
('Chinese Calligraphy Scroll', 'A scroll with traditional Chinese calligraphy.', '30x100 cm', '1700-09-10', 'Chinese art collection', 'Artistic representation of Chinese culture.'),
('Greek Sculpture', 'A small marble sculpture from ancient Greece.', '25x15 cm', '1701-10-09', 'Greek archaeological site', 'Example of classical Greek art.'),
('Mughal Miniature Painting', 'A miniature painting from the Mughal era.', '10x15 cm', '1600-12-25', 'Mughal art collection', 'Artistic heritage of the Mughal dynasty.'),
('Aztec Pottery', 'Pottery artifacts from the Aztec civilization.', 'Various sizes', '1700-10-09', 'Aztec archaeological site', 'Insight into Aztec craftsmanship and culture.'),
('Viking Brooch', 'A decorative brooch worn by Viking warriors.', '5 cm diameter', '1704-10-09', 'Viking archaeological site', 'Symbol of Viking craftsmanship.'),
('Inca Textile', 'An intricate textile from the Inca civilization.', '50x100 cm', '1700-11-09', 'Inca archaeological site', 'Artistic and cultural heritage of the Inca.'),
('Indus Valley Seal', 'A seal from the ancient Indus Valley civilization.', '3x3 cm', '1756-10-02', 'Indus Valley archaeological site', 'Key artifact for understanding Indus Valley script.'),
('Byzantine Icon', 'A religious icon from the Byzantine era.', '20x30 cm', '1100-08-08', 'Byzantine art collection', 'Religious significance in Byzantine Christianity.'),
('Ottoman Sword', 'A ceremonial sword from the Ottoman Empire.', '80 cm length', '1700-11-11', 'Ottoman historical collection', 'Symbol of Ottoman military tradition.'),
('Renaissance Manuscript', 'A handwritten manuscript from the Renaissance period.', '20x30 cm', '1550-03-03', 'European historical collection', 'Literary and historical significance from the Renaissance.'),
('Celtic Torc', 'A gold torc worn by Celtic tribes.', '25 cm diameter', '1701-10-03', 'Celtic archaeological site', 'Symbol of Celtic cultural identity.'),
('Japanese Woodblock Print', 'A traditional woodblock print from Japan.', '30x40 cm', '1800-07-07', 'Japanese art collection', 'Artistic representation of Japanese history.'),
('African Tribal Mask', 'A ceremonial mask from an African tribe.', 'Various sizes', '1900-02-02', 'African tribal collection', 'Symbol of African cultural heritage.'),
('Medieval Knight Helmet', 'A medieval helmet worn by knights.', 'Various sizes', '1300-10-10', 'Medieval historical collection', 'Symbol of medieval chivalry.');

-- insert records in curators
INSERT INTO Curators (UserID, Name, ContactInfo, Country)
SELECT UserID, Username, Email, 'Pakistan' FROM Users WHERE Role = 'curator';

-- inset record in Exhibits 
INSERT INTO exhibits (Title, Description, CuratorID, Layout, VirtualTour, EducationalMaterials)
VALUES
('Ancient Artifacts Exhibit', 'Explore artifacts from ancient civilizations.', 1, 'Interactive', 'https://example.com/virtualtour1', 'https://example.com/edu_materials1'),
('Modern Art Showcase', 'Discover contemporary masterpieces.', 2, 'Gallery', 'https://example.com/virtualtour2', 'https://example.com/edu_materials2'),
('Historical Artifacts Display', 'A collection of historical relics.', 3, 'Museum Style', 'https://example.com/virtualtour3', 'https://example.com/edu_materials3'),
('Nature-Inspired Art Exhibit', 'Artworks inspired by nature.', 4, 'Open Space', 'https://example.com/virtualtour4', 'https://example.com/edu_materials4'),
('Cultural Heritage Showcase', 'Diverse cultural artifacts.', 5, 'Interactive', 'https://example.com/virtualtour5', 'https://example.com/edu_materials5'),
('Abstract Art Gallery', 'Exploring abstract expressions.', 6, 'Gallery', 'https://example.com/virtualtour6', 'https://example.com/edu_materials6'),
('Digital Art Experience', 'Immersive digital artworks.', 7, 'Interactive', 'https://example.com/virtualtour7', 'https://example.com/edu_materials7'),
('Sculpture Garden', 'Outdoor sculpture exhibit.', 8, 'Garden', 'https://example.com/virtualtour8', 'https://example.com/edu_materials8'),
('Renaissance Art Collection', 'Masterpieces from the Renaissance era.', 9, 'Gallery', 'https://example.com/virtualtour9', 'https://example.com/edu_materials9'),
('Fantasy Art Journey', 'Artworks inspired by fantasy worlds.', 10, 'Interactive', 'https://example.com/virtualtour10', 'https://example.com/edu_materials10'),
('Ancient Civilization Art', 'Artifacts from ancient cultures.', 11, 'Museum Style', 'https://example.com/virtualtour11', 'https://example.com/edu_materials11'),
('Contemporary Art Exhibition', 'Exploring contemporary art trends.', 12, 'Gallery', 'https://example.com/virtualtour12', 'https://example.com/edu_materials12'),
('Nature-Inspired Art Showcase', 'Artworks inspired by natural elements.', 13, 'Open Space', 'https://example.com/virtualtour13', 'https://example.com/edu_materials13'),
('Historical Artifacts Journey', 'A journey through historical artifacts.', 14, 'Museum Style', 'https://example.com/virtualtour14', 'https://example.com/edu_materials14'),
('Cultural Diversity Display', 'Celebrating cultural diversity.', 15, 'Interactive', 'https://example.com/virtualtour15', 'https://example.com/edu_materials15'),
('Abstract Art Experience', 'Immersive exploration of abstract art.', 16, 'Gallery', 'https://example.com/virtualtour16', 'https://example.com/edu_materials16'),
('Digital Art Gallery', 'Showcasing digital art creations.', 17, 'Interactive', 'https://example.com/virtualtour17', 'https://example.com/edu_materials17'),
('Outdoor Sculpture Showcase', 'Sculpture art in an outdoor setting.', 18, 'Garden', 'https://example.com/virtualtour18', 'https://example.com/edu_materials18'),
('Renaissance Art Journey', 'Exploring the Renaissance through art.', 19, 'Gallery', 'https://example.com/virtualtour19', 'https://example.com/edu_materials19'),
('Fantasy Art Gallery', 'A gallery of fantasy-inspired artworks.', 20, 'Interactive', 'https://example.com/virtualtour20', 'https://example.com/edu_materials20'),
('Ancient Artifacts Journey', 'A journey into ancient civilizations.', 21, 'Museum Style', 'https://example.com/virtualtour21', 'https://example.com/edu_materials21'),
('Contemporary Art Gallery', 'An immersive contemporary art experience.', 22, 'Gallery', 'https://example.com/virtualtour22', 'https://example.com/edu_materials22'),
('Nature Art Exhibition', 'An exhibition celebrating nature.', 23, 'Open Space', 'https://example.com/virtualtour23', 'https://example.com/edu_materials23'),
('Historical Artifacts Showcase', 'Showcasing historical treasures.', 24, 'Museum Style', 'https://example.com/virtualtour24', 'https://example.com/edu_materials24'),
('Cultural Heritage Display', 'Exploring diverse cultural heritage.', 25, 'Interactive', 'https://example.com/virtualtour25', 'https://example.com/edu_materials25'),
('Abstract Art Journey', 'Embarking on a journey of abstract art.', 26, 'Gallery', 'https://example.com/virtualtour26', 'https://example.com/edu_materials26'),
('Digital Art Showcase', 'Showcasing immersive digital artworks.', 27, 'Interactive', 'https://example.com/virtualtour27', 'https://example.com/edu_materials27'),
('Sculpture Art Garden', 'An art garden with sculpture exhibits.', 28, 'Garden', 'https://example.com/virtualtour28', 'https://example.com/edu_materials28'),
('Renaissance Art Collection', 'A collection of Renaissance masterpieces.', 29, 'Gallery', 'https://example.com/virtualtour29', 'https://example.com/edu_materials29'),
('Fantasy Art Journey', 'Embarking on a journey of fantasy art.', 30, 'Interactive', 'https://example.com/virtualtour30', 'https://example.com/edu_materials30');

-- insert records into artists
INSERT INTO Artists (Name, Lifespan, Nationality, Biography, RelevantArtifacts) VALUES
('Leonardo da Vinci', '1452-1519', 'Italian', 'Leonardo di ser Piero da Vinci was an Italian polymath of the High Renaissance who is widely considered one of the greatest artists of all time.', 'Mona Lisa, The Last Supper'),
('Vincent van Gogh', '1853-1890', 'Dutch', 'Vincent Willem van Gogh was a Dutch Post-Impressionist painter who is among the most famous and influential figures in the history of Western art.', 'Starry Night, Sunflowers'),
('Pablo Picasso', '1881-1973', 'Spanish', 'Pablo Picasso was a Spanish painter, sculptor, printmaker, ceramicist, and stage designer who spent most of his adult life in France.', 'Guernica, Les Demoiselles d''Avignon'),
('Michelangelo', '1475-1564', 'Italian', 'Michelangelo di Lodovico Buonarroti Simoni was an Italian sculptor, painter, architect, and poet of the High Renaissance.', 'David, Sistine Chapel ceiling'),
('Rembrandt', '1606-1669', 'Dutch', 'Rembrandt Harmenszoon van Rijn was a Dutch draughtsman, painter, and printmaker.', 'The Night Watch, The Anatomy Lesson of Dr. Nicolaes Tulp'),
('Claude Monet', '1840-1926', 'French', 'Oscar-Claude Monet was a French painter and founder of the Impressionist movement.', 'Water Lilies, Impression, Sunrise'),
('Georgia O''Keeffe', '1887-1986', 'American', 'Georgia Totto O''Keeffe was an American artist. She was known for her paintings of enlarged flowers, New York skyscrapers, and New Mexico landscapes.', 'Black Iris, Red Canna'),
('Salvador Dali', '1904-1989', 'Spanish', 'Salvador Domingo Felipe Jacinto Dalí i Domènech, 1st Marquess of Dalí de Púbol was a Spanish Surrealist artist renowned for his technical skill, precise draftsmanship, and the striking and bizarre images in his work.', 'The Persistence of Memory, The Elephants'),
('Jackson Pollock', '1912-1956', 'American', 'Paul Jackson Pollock was an American painter and a major figure in the Abstract Expressionist movement.', 'No. 5, 1948, Autumn Rhythm'),
('Frida Kahlo', '1907-1954', 'Mexican', 'Magdalena Carmen Frida Kahlo y Calderón was a Mexican painter known for her many portraits, self-portraits, and works inspired by the nature and artifacts of Mexico.', 'The Two Fridas, Self-Portrait with Thorn Necklace and Hummingbird'),
('Andy Warhol', '1928-1987', 'American', 'Andy Warhol was an American artist, film director, and producer who was a leading figure in the visual art movement known as pop art.', 'Campbell''s Soup Cans, Marilyn Diptych'),
('Henri Matisse', '1869-1954', 'French', 'Henri Émile Benoît Matisse was a French artist, known for both his use of color and his fluid and original draughtsmanship.', 'The Dance, Woman with a Hat'),
('Edvard Munch', '1863-1944', 'Norwegian', 'Edvard Munch was a Norwegian painter and printmaker whose intensely evocative treatment of psychological themes built upon some of the main tenets of late 19th-century Symbolism and greatly influenced German Expressionism in the early 20th century.', 'The Scream, Madonna'),
('Paul Cézanne', '1839-1906', 'French', 'Paul Cézanne was a French artist and Post-Impressionist painter whose work laid the foundations of the transition from the 19th-century conception of artistic endeavor to a new and radically different world of art in the 20th century.', 'The Card Players, Mont Sainte-Victoire'),
('Diego Rivera', '1886-1957', 'Mexican', 'Diego María de la Concepción Juan Nepomuceno Estanislao de la Rivera y Barrientos Acosta y Rodríguez was a prominent Mexican painter and the husband of Frida Kahlo.', 'Man at the Crossroads, Detroit Industry Murals'),
('Marc Chagall', '1887-1985', 'Russian-French', 'Marc Zakharovich Chagall was a Russian-French artist of Belarusian Jewish origin.', 'I and the Village, The Birthday'),
('Jean-Michel Basquiat', '1960-1988', 'American', 'Jean-Michel Basquiat was an American artist of Haitian and Puerto Rican descent. Basquiat first achieved fame as part of SAMO, an informal graffiti duo who wrote enigmatic epigrams in the cultural hotbed of the Lower East Side of Manhattan during the late 1970s.', 'Untitled, Irony of a Negro Policeman'),
('Jackson Pollock', '1912-1956', 'American', 'Paul Jackson Pollock was an American painter and a major figure in the Abstract Expressionist movement.', 'No. 5, 1948, Autumn Rhythm'),
('Willem de Kooning', '1904-1997', 'American-Dutch', 'Willem de Kooning was a Dutch-American abstract expressionist artist. He was born in Rotterdam, the Netherlands, and moved to the United States in 1926.', 'Woman series, Excavation'),
('Gustav Klimt', '1862-1918', 'Austrian', 'Gustav Klimt was an Austrian symbolist painter and one of the most prominent members of the Vienna Secession movement.', 'The Kiss, Portrait of Adele Bloch-Bauer I'),
('Roy Lichtenstein', '1923-1997', 'American', 'Roy Fox Lichtenstein was an American pop artist. During the 1960s, along with Andy Warhol, Jasper Johns, and James Rosenquist among others, he became a leading figure in the new art movement.', 'Whaam!, Drowning Girl'),
('Mark Rothko', '1903-1970', 'American', 'Mark Rothko, born Markus Yakovlevich Rothkowitz, was an American painter of Russian Jewish descent.', 'No. 61 (Rust and Blue), No. 14 (White and Greens in Blue)'),
('Auguste Rodin', '1840-1917', 'French', 'François Auguste René Rodin, known as Auguste Rodin, was a French sculptor.', 'The Thinker, The Kiss'),
('Edward Hopper', '1882-1967', 'American', 'Edward Hopper was an American realist painter and printmaker.', 'Nighthawks, Gas'),
('Paul Gauguin', '1848-1903', 'French', 'Eugène Henri Paul Gauguin was a French Post-Impressionist artist.', 'Where Do We Come From? What Are We? Where Are We Going?, The Yellow Christ'),
('Raphael', '1483-1520', 'Italian', 'Raffaello Sanzio da Urbino, known as Raphael, was an Italian painter and architect of the High Renaissance.', 'The School of Athens, The Sistine Madonna'),
('Caravaggio', '1571-1610', 'Italian', 'Michelangelo Merisi da Caravaggio was an Italian painter active in Rome for most of his artistic life.', 'The Calling of Saint Matthew, The Conversion of Saint Paul'),
('Hieronymus Bosch', '1450-1516', 'Dutch', 'Hieronymus Bosch was a Dutch/Netherlandish painter from Brabant.', 'The Garden of Earthly Delights, The Haywain Triptych'),
('El Greco', '1541-1614', 'Greek-Spanish', 'Doménikos Theotokópoulos, known as El Greco, was a Greek painter, sculptor, and architect of the Spanish Renaissance.', 'The Burial of the Count of Orgaz, View of Toledo'),
('Pieter Bruegel the Elder', '1525-1569', 'Flemish', 'Pieter Bruegel the Elder was a Flemish painter and printmaker from Brabant, known for his landscapes and peasant scenes.', 'The Tower of Babel, The Peasant Wedding'),
('Henri de Toulouse-Lautrec', '1864-1901', 'French', 'Henri Marie Raymond de Toulouse-Lautrec-Monfa was a French painter, printmaker, draughtsman, caricaturist, and illustrator whose immersion in the colorful and theatrical life of Paris in the late 19th century allowed him to produce a collection of enticing, elegant, and provocative images of the modern, sometimes decadent, life of those times.', 'Moulin Rouge: La Goulue, At the Moulin Rouge'),
('Camille Pissarro', '1830-1903', 'French', 'Jacob Abraham Camille Pissarro was a Danish-French Impressionist and Neo-Impressionist painter born on the island of St Thomas.', 'Boulevard Montmartre, Afternoon, Sunlight Effect, Apple Harvest'),
('Diego Velázquez', '1599-1660', 'Spanish', 'Diego Rodríguez de Silva y Velázquez was a Spanish painter, the leading artist in the court of King Philip IV.', 'Las Meninas, The Surrender of Breda'),
('Peter Paul Rubens', '1577-1640', 'Flemish', 'Sir Peter Paul Rubens was a Flemish artist.', 'The Descent from the Cross, The Garden of Love'),
('Albrecht Dürer', '1471-1528', 'German', 'Albrecht Dürer was a German painter, printmaker, and theorist of the German Renaissance.', 'Melencolia I, The Four Horsemen of the Apocalypse'),
('Giotto di Bondone', '1266-1337', 'Italian', 'Giotto di Bondone, known mononymously as Giotto, was an Italian painter and architect from Florence during the Late Middle Ages.', 'The Arena Chapel frescoes, Lamentation of Christ'),
('Titian', '1488-1576', 'Italian', 'Tiziano Vecelli or Tiziano Vecellio, known in English as Titian, was an Italian painter during the Renaissance.', 'Venus of Urbino, Assumption of the Virgin'),
('Francisco Goya', '1746-1828', 'Spanish', 'Francisco José de Goya y Lucientes was a Spanish romantic painter and printmaker.', 'The Third of May 1808, Saturn Devouring His Son'),
('Edgar Degas', '1834-1917', 'French', 'Hilaire-Germain-Edgar De Gas, known as Edgar Degas, was a French painter, sculptor, printmaker, and draftsman.', 'The Absinthe Drinker, Ballet Rehearsal'),
('Georges Seurat', '1859-1891', 'French', 'Georges-Pierre Seurat was a French post-Impressionist painter and draftsman.', 'A Sunday Afternoon on the Island of La Grande Jatte, The Circus'),
('Jan van Eyck', '1390-1441', 'Flemish', 'Jan van Eyck was a Flemish painter active in Bruges.', 'The Arnolfini Portrait, Ghent Altarpiece'),
('Johannes Vermeer', '1632-1675', 'Dutch', 'Johannes Vermeer was a Dutch Baroque Period painter who specialized in domestic interior scenes of middle-class life.', 'Girl with a Pearl Earring, The Milkmaid');


-- insert into periodsmovements
INSERT INTO PeriodsMovements (Name, Description) VALUES
('Renaissance', 'The Renaissance was a period in European history, covering the span between the 14th and 17th centuries. It is an era of cultural rebirth and artistic revival, marked by significant developments in art, literature, science, and philosophy.'),
('Baroque', 'The Baroque period was a cultural and artistic movement in the 17th and early 18th centuries. It is characterized by dramatic expression, grandeur, and emotional intensity in art, music, architecture, and literature.'),
('Impressionism', 'Impressionism was an art movement that originated in the late 19th century in France. It is characterized by visible brush strokes, emphasis on light and its changing qualities, ordinary subject matter, and the inclusion of movement as a crucial element of human perception and experience.'),
('Cubism', 'Cubism was an avant-garde art movement that revolutionized European painting and sculpture in the early 20th century. It is characterized by the use of geometric shapes, fragmented forms, and multiple perspectives to depict the subject.'),
('Surrealism', 'Surrealism was a cultural movement that began in the early 1920s, known for its visual artworks and writings. It aimed to express the subconscious mind through art, emphasizing the importance of the imagination and dreams.'),
('Abstract Expressionism', 'Abstract Expressionism was a post-World War II art movement that emphasized spontaneous, automatic, or subconscious creation. It is characterized by large-scale paintings that convey emotional or expressive content.'),
('Pop Art', 'Pop Art emerged in the mid-20th century, challenging traditional notions of art by incorporating imagery from popular culture and mass media.'),
('Minimalism', 'Minimalism emerged in the late 1950s, characterized by simplicity, abstraction, and emphasis on form. It rejects traditional decorative elements in favor of clean lines and geometric shapes.'),
('Rococo', 'Rococo was a style of art and decoration that emerged in France in the early 18th century. It is characterized by elaborate ornamentation, pastel colors, and playful, lighthearted themes.'),
('Romanticism', 'Romanticism was an artistic, literary, musical, and intellectual movement that originated in Europe toward the end of the 18th century. It emphasized emotion, individualism, nature, and the sublime.'),
('Neoclassicism', 'Neoclassicism was a Western cultural movement in the decorative and visual arts, literature, theatre, music, and architecture that drew inspiration from the art and culture of classical antiquity.'),
('Realism', 'Realism was an art movement that emerged in the mid-19th century as a response to Romanticism. It sought to depict subjects truthfully and objectively, often focusing on ordinary people and everyday life.'),
('Fauvism', 'Fauvism was an early 20th-century art movement that emphasized strong color and bold brushwork over realistic representation.'),
('Post-Impressionism', 'Post-Impressionism was a term coined to describe the development of French art after Impressionism. It encompasses various styles and techniques that diverged from Impressionist principles.'),
('Expressionism', 'Expressionism was an art movement in the early 20th century that focused on expressing emotions and feelings through the use of bold colors and exaggerated imagery.'),
('Dadaism', 'Dadaism was an art movement of the European avant-garde in the early 20th century. It rejected traditional aesthetic values and sought to provoke outrage and shock through absurdity and irrationality.'),
('Art Nouveau', 'Art Nouveau was an international style of art, architecture, and design that peaked in popularity at the turn of the 20th century. It is characterized by organic, flowing forms inspired by nature.'),
('Abstract Art', 'Abstract art is art that does not attempt to represent an accurate depiction of visual reality but instead uses shapes, colors, forms, and gestural marks to achieve its effect.'),
('Surrealism', 'Surrealism was a cultural movement that began in the early 1920s, known for its visual artworks and writings. It aimed to express the subconscious mind through art, emphasizing the importance of the imagination and dreams.'),
('Contemporary Art', 'Contemporary art refers to art produced at the present period in time or art that has been produced since World War II. It encompasses a wide range of styles, techniques, and themes.');

-- insert into locations
INSERT INTO Locations (Name, Description, Latitude, Longitude) VALUES
('Louvre Museum', 'The Louvre Museum is located in Paris, France, and is one of the world''s largest and most visited museums.', 48.8606, 2.3376),
('British Museum', 'The British Museum is located in London, United Kingdom, and houses a vast collection of art and artifacts from around the world.', 51.5194, -0.1270),
('Metropolitan Museum of Art', 'The Metropolitan Museum of Art, commonly known as the Met, is located in New York City, USA, and is one of the largest and most comprehensive art museums in the world.', 40.7794, -73.9632),
('Vatican Museums', 'The Vatican Museums are located within Vatican City, Italy, and house an extensive collection of art and artifacts, including the Sistine Chapel ceiling painted by Michelangelo.', 41.9022, 12.4530),
('State Hermitage Museum', 'The State Hermitage Museum is located in Saint Petersburg, Russia, and is one of the largest and oldest museums in the world, featuring a vast collection of art and cultural artifacts.', 59.9403, 30.3135),
('Prado Museum', 'The Prado Museum, officially known as the Museo Nacional del Prado, is located in Madrid, Spain, and is renowned for its collection of European art, including works by Goya, Velázquez, and El Greco.', 40.4139, -3.6922),
('National Gallery of Art', 'The National Gallery of Art is located in Washington, D.C., USA, and houses a rich collection of Western art, including works by Leonardo da Vinci, Rembrandt, and Van Gogh.', 38.8913, -77.0199),
('Uffizi Gallery', 'The Uffizi Gallery is located in Florence, Italy, and is famous for its collection of Renaissance art, including works by Botticelli, Michelangelo, and Leonardo da Vinci.', 43.7696, 11.2558),
('Rijksmuseum', 'The Rijksmuseum is located in Amsterdam, Netherlands, and is dedicated to arts, crafts, and history. It houses masterpieces by Dutch artists such as Rembrandt and Vermeer.', 52.3600, 4.8852),
('Tate Modern', 'Tate Modern is located in London, United Kingdom, and is Britain''s national gallery of international modern art. It features works by artists like Picasso, Warhol, and Rothko.', 51.5076, -0.0994);

-- insert into donations table
INSERT INTO Donations (UserID, Amount, DonationDate, Purpose) VALUES
(1, 100.00, '2024-05-01', 'Supporting virtual exhibit development and digital art projects'),
(3, 50.00, '2024-05-02', 'Funding online educational programs for students and teachers'),
(5, 75.00, '2024-05-03', 'Investing in technology upgrades for enhanced virtual experiences'),
(9, 200.00, '2024-05-04', 'Preservation and conservation efforts for digital artifacts and historical records'),
(12, 150.00, '2024-05-05', 'Supporting cultural heritage research and digital archiving initiatives'),
(15, 300.00, '2024-05-06', 'Promoting accessibility and inclusivity through digital museum resources'),
(20, 25.00, '2024-05-07', 'Investing in interactive learning tools and virtual tour enhancements'),
(25, 80.00, '2024-05-08', 'Funding virtual events and online exhibitions for global audiences'),
(29, 120.00, '2024-05-09', 'Supporting community engagement projects and outreach programs'),
(33, 250.00, '2024-05-10', 'Advancing digital storytelling and multimedia content creation for exhibits'),
(39, 40.00, '2024-05-11', 'Investing in conservation projects for virtual museum collections'),
(50, 60.00, '2024-05-12', 'Promoting cultural diversity and heritage preservation through digital initiatives'),
(65, 90.00, '2024-05-13', 'Supporting art conservation and restoration efforts in digital formats'),
(73, 180.00, '2024-05-14', 'Funding virtual reality experiences and immersive digital installations'),
(77, 270.00, '2024-05-15', 'Enhancing digital engagement platforms for interactive learning experiences'),
(80, 30.00, '2024-05-16', 'Investing in digital humanities projects and scholarly research'),
(89, 70.00, '2024-05-17', 'Supporting virtual museum accessibility for visitors with disabilities'),
(98, 110.00, '2024-05-18', 'Funding innovative technology solutions for digital preservation'),
(100, 220.00, '2024-05-19', 'Promoting art education and cultural literacy through online resources'),
(103, 350.00, '2024-05-20', 'Supporting sustainable practices in digital museum operations and exhibits');

-- insert into educationalresources.
INSERT INTO EducationalResources (Title, Description, Content, ResourceType, RelatedArtifacts) VALUES
('Introduction to Art History', 'A beginner-friendly guide to art history concepts.', 'art_history_intro.pdf', 'text', '105,106,107'),
('Basic Principles of Photography', 'Learn about composition, lighting, and techniques in photography.', 'photography_principles_video.mp4', 'video', '107,108'),
('Ancient Civilizations: Overview', 'Explore the history and culture of ancient civilizations.', 'ancient_civilizations_text.docx', 'text', '109,110,111'),
('Introduction to Astronomy', 'Discover the wonders of the universe and celestial objects.', 'astronomy_intro_audio.mp3', 'audio', '401'),
('Environmental Conservation Tips', 'Tips and guidelines for promoting environmental conservation.', 'conservation_tips_text.docx', 'text', '112,113'),
('Music Theory Basics', 'Learn fundamental concepts in music theory and notation.', 'music_theory_basics_video.mp4', 'video', '114'),
('Introduction to Coding', 'An introductory course to coding and programming basics.', 'coding_intro_text.docx', 'text', '115,116'),
('Introduction to Biology', 'Explore the basics of biology, ecosystems, and life sciences.', 'biology_intro_audio.mp3', 'audio', '117,118,119'),
('World Literature Classics', 'A collection of classic literary works from around the world.', 'world_literature_classics_text.docx', 'text', '120,121,122'),
('History of Modern Art', 'An overview of modern art movements and key artists.', 'modern_art_history_video.mp4', 'video', '123,124'),
('Digital Art Techniques', 'Learn digital art techniques using software tools and creative processes.', 'digital_art_techniques_text.docx', 'text', '125,126'),
('Introduction to Physics', 'Basic principles of physics, forces, and energy.', 'physics_intro_audio.mp3', 'audio', '127,128'),
('Literary Analysis: Themes and Symbols', 'Analyzing literary themes, symbols, and narrative techniques.', 'literary_analysis_video.mp4', 'video', '129'),
('Introduction to Economics', 'An introductory course to economic concepts and theories.', 'economics_intro_text.docx', 'text', '130,131'),
('Space Exploration: History and Future', 'Exploring the history and future of space exploration.', 'space_exploration_audio.mp3', 'audio', '132,133'),
('Artificial Intelligence Basics', 'Understanding artificial intelligence and machine learning.', 'ai_basics_text.docx', 'text', '134,135'),
('Introduction to Psychology', 'Basic concepts in psychology, behavior, and mental processes.', 'psychology_intro_video.mp4', 'video', '136,137'),
('Climate Change: Impacts and Solutions', 'Understanding climate change, its impacts, and mitigation strategies.', 'climate_change_text.docx', 'text', '138,139'),
('Creative Writing Workshop', 'Techniques and exercises for creative writing and storytelling.', 'creative_writing_workshop_audio.mp3', 'audio', '140'),
('Introduction to Robotics', 'An introduction to robotics, automation, and robotics applications.', 'robotics_intro_text.docx', 'text', '141,142');

-- insert into events
INSERT INTO Events (Title, Description, DateTime, LocationID, Organizer) VALUES
('Art Exhibition Opening', 'Join us for the grand opening of our latest art exhibition.', '2024-06-01 10:00:00', 1, 'Museum Events Team'),
('Virtual Lecture Series: Ancient Civilizations', 'Explore the history of ancient civilizations in this engaging lecture series.', '2024-06-05 15:00:00', 2, 'Prof. Smith'),
('Digital Art Workshop for Kids', 'A fun and creative workshop for kids to learn digital art techniques.', '2024-06-10 14:00:00', 3, 'Art Studio'),
('Archaeology Symposium: Uncovering the Past', 'Join archaeologists as they discuss recent discoveries and research.', '2024-06-15 09:30:00', 4, 'Archaeological Society'),
('Virtual Tour: Space Exploration', 'Embark on a virtual journey through the cosmos and learn about space exploration.', '2024-06-20 13:00:00', 5, 'Space Center'),
('Live Music Performance: Jazz Night', 'Enjoy a night of live jazz music performed by talented musicians.', '2024-06-25 19:00:00', 6, 'Jazz Club'),
('Artisan Market: Local Crafts and Creations', 'Browse and shop for unique handmade crafts and artisanal products.', '2024-07-01 11:00:00', 7, 'Local Artisans Association'),
('Virtual Workshop: Digital Photography Basics', 'Learn the fundamentals of digital photography in this interactive workshop.', '2024-07-05 16:30:00', 8, 'Photography Studio'),
('History Lecture: World War II in Focus', 'Delve into the history of World War II with expert speakers.', '2024-07-10 10:30:00', 9, 'History Institute'),
('Children Science Fair: Explore and Experiment', 'A fun and educational science fair for children to explore scientific concepts.', '2024-07-15 12:00:00', 10, 'Science Center'),
('Digital Art Exhibition: Contemporary Perspectives', 'Discover innovative digital artworks by contemporary artists.', '2024-07-20 14:00:00', 1, 'Digital Art Collective'),
('Literary Reading: Poems and Prose', 'An evening of literary readings featuring poets and writers.', '2024-07-25 18:00:00', 2, 'Literary Society'),
('Virtual Science Symposium: Future Technologies', 'Explore emerging technologies and their impact on society.', '2024-08-01 09:00:00', 3, 'Tech Innovators Forum'),
('Art History Lecture: Renaissance Masterpieces', 'An in-depth look at masterpieces from the Renaissance period.', '2024-08-05 11:30:00', 4, 'Art History Society'),
('Virtual Tour: Underwater Wonders', 'Dive into the world of underwater wonders with our virtual tour.', '2024-08-10 15:00:00', 5, 'Marine Conservation Society'),
('Live Theater Performance: Shakespearean Classics', 'Experience timeless Shakespearean plays brought to life on stage.', '2024-08-15 19:30:00', 6, 'Theater Company'),
('Craft Workshop: Handmade Jewelry Design', 'Create your own unique jewelry pieces in this hands-on workshop.', '2024-08-20 13:00:00', 7, 'Jewelry Studio'),
('History Symposium: Ancient Civilizations Revisited', 'A scholarly exploration of ancient civilizations and their legacies.', '2024-08-25 10:30:00', 8, 'Historical Society'),
('Virtual Nature Walk: Exploring Wilderness', 'Take a virtual nature walk and discover the beauty of wilderness.', '2024-09-01 16:00:00', 9, 'Nature Conservancy'),
('Science Workshop: Robotics and Innovation', 'Learn about robotics and innovation in this interactive science workshop.', '2024-09-05 11:00:00', 10, 'Science Institute'),
('Art Workshop: Abstract Painting Techniques', 'Explore abstract painting techniques with professional artists.', '2024-09-10 14:30:00', 1, 'Art Studio'),
('Literary Salon: Contemporary Writers Showcase', 'An evening celebrating contemporary writers and their works.', '2024-09-15 18:30:00', 2, 'Literary Association'),
('Virtual Lecture: Environmental Conservation Challenges', 'Discussing the challenges and solutions for environmental conservation.', '2024-09-20 09:30:00', 3, 'Environmental Group'),
('Historical Tour: Ancient Ruins and Civilizations', 'Embark on a virtual tour of ancient ruins and historical sites.', '2024-09-25 12:00:00', 4, 'Historical Tours'),
('Live Music Concert: Classical Masterpieces', 'Experience classical music masterpieces performed by talented musicians.', '2024-09-30 20:00:00', 5, 'Music Society'),
('Digital Art Workshop: Creative Digital Techniques', 'Learn creative digital art techniques in this hands-on workshop.', '2024-10-05 15:30:00', 6, 'Digital Art Studio'),
('Science Fair: Exploring the Universe', 'A science fair exploring mysteries of the universe and space exploration.', '2024-10-10 11:00:00', 7, 'Space Science Center'),
('Literary Reading: Short Stories and Essays', 'An evening of literary readings featuring short stories and essays.', '2024-10-15 19:00:00', 8, 'Literary Club'),
('Virtual Workshop: Multimedia Storytelling', 'Explore multimedia storytelling techniques in this interactive workshop.', '2024-10-20 14:00:00', 9, 'Storytelling Institute'),
('Art History Symposium: Modern Art Movements', 'An exploration of modern art movements and their impact on art history.', '2024-10-25 10:00:00', 10, 'Art History Society');

-- insert into interactions
INSERT INTO Interactions (UserID, ArtifactID, InteractionType) VALUES
(1, 1, 'like'),
(2, 2, 'favorite'),
(3, 3, 'comment'),
(4, 4, 'like'),
(5, 5, 'favorite'),
(6, 6, 'comment'),
(7, 7, 'like'),
(8, 8, 'favorite'),
(9, 9, 'comment'),
(10, 10, 'like'),
(11, 11, 'favorite'),
(12, 12, 'comment'),
(13, 13, 'like'),
(14, 14, 'favorite'),
(15, 15, 'comment'),
(16, 16, 'like'),
(17, 17, 'favorite'),
(18, 18, 'comment'),
(19, 19, 'like'),
(20, 20, 'favorite'),
(21, 21, 'comment'),
(22, 22, 'like'),
(23, 23, 'favorite'),
(24, 24, 'comment'),
(25, 25, 'like'),
(26, 26, 'favorite'),
(27, 27, 'comment'),
(28, 28, 'like'),
(29, 29, 'favorite'),
(30, 30, 'comment'),
(31, 31, 'like'),
(32, 32, 'favorite'),
(33, 33, 'comment'),
(34, 34, 'like'),
(35, 35, 'favorite'),
(36, 36, 'comment'),
(37, 37, 'like'),
(38, 38, 'favorite'),
(39, 39, 'comment'),
(40, 40, 'like'),
(41, 41, 'favorite');


-- Insert into feedbacksurveys
INSERT INTO FeedbackSurveys (UserID, FeedbackType, Message)
VALUES
(1, 'general', 'The virtual museum tour was informative and engaging.'),
(2, 'survey', 'Rate your experience with the virtual reality exhibits.'),
(3, 'general', 'I found the historical artifact descriptions very detailed.'),
(4, 'general', 'The interactive exhibits are a great learning experience.'),
(5, 'survey', 'How likely are you to recommend the virtual museum to others?'),
(6, 'general', 'The museum website navigation is user-friendly.'),
(7, 'survey', 'Did you find the museum audio guides helpful?'),
(8, 'general', 'The virtual museum experience exceeded my expectations.'),
(9, 'general', 'I would like to see more exhibits on ancient civilizations.'),
(10, 'survey', 'Rate the accessibility options for visitors with disabilities.'),
(11, 'general', 'The museums collection showcases a diverse range of artworks.'),
(12, 'survey', 'How satisfied are you with the virtual museum ticketing process?'),
(13, 'general', 'The virtual museum interface is visually appealing.'),
(14, 'general', 'I enjoyed the interactive activities for children.'),
(15, 'survey', 'Rate the educational content provided in the virtual exhibits.'),
(16, 'general', 'The museum curator did an excellent job explaining the exhibits.'),
(17, 'survey', 'Would you like to see more virtual reality experiences in the museum?'),
(18, 'general', 'I encountered difficulties accessing certain exhibit sections.'),
(19, 'general', 'The virtual museum historical timelines are well-organized.'),
(20, 'survey', 'How satisfied are you with the virtual museum customer support?'),
(21, 'general', 'The virtual museum 3D models are impressive.'),
(22, 'survey', 'Rate your overall satisfaction with the virtual museum experience.'),
(23, 'general', 'I have some suggestions for improving the museum mobile app.'),
(24, 'general', 'The museum virtual tours offer a comprehensive view of artworks.'),
(25, 'survey', 'Did you find the virtual museum interactive quizzes engaging?'),
(26, 'general', 'The museum historical artifacts are well-preserved.'),
(27, 'survey', 'How likely are you to revisit the virtual museum in the future?'),
(28, 'general', 'I encountered a bug while using the virtual reality headset.'),
(29, 'general', 'The virtual museum audio commentary is informative.'),
(30, 'survey', 'Rate the ease of navigation within the virtual museum.'),
(31, 'general', 'I am impressed with the virtual museum digital exhibitions.'),
(32, 'survey', 'Would you recommend the virtual museum to your colleagues?'),
(33, 'general', 'I experienced a delay in loading certain exhibit content.'),
(34, 'general', 'The virtual museum thematic collections are well-curated.'),
(35, 'survey', 'Did you find the virtual museum guided tours helpful?'),
(36, 'general', 'The virtual museum search function is efficient.'),
(37, 'survey', 'How likely are you to participate in upcoming virtual events by the museum?'),
(38, 'general', 'I have feedback regarding the museum virtual gift shop.'),
(39, 'general', 'The virtual museum video presentations are engaging.'),
(40, 'survey', 'Rate your satisfaction with the virtual museum educational resources.');

