DROP TABLE IF EXISTS comes_from;
DROP TABLE IF EXISTS sale;
DROP TABLE IF EXISTS materials_used;
DROP TABLE IF EXISTS project_ideas;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS artwork;
DROP TABLE IF EXISTS materials;

CREATE TABLE materials
(
ID INT AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
category VARCHAR(255),
cost DECIMAL(6,2),
location_of_shop VARCHAR(255),
size VARCHAR(255),
general_notes VARCHAR(1000),
PRIMARY KEY (ID)
) ENGINE = innodb;

CREATE TABLE artwork
(
ID INT AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
type VARCHAR(255),
description VARCHAR(255),
anticipated_date DATE,
anticipated_cost Decimal(6, 2),
status CHAR(1),
PRIMARY KEY (ID)
) ENGINE = innodb;

CREATE TABLE client
(
ID INT AUTO_INCREMENT,
type VARCHAR(255),
name_first VARCHAR(255),
name_last VARCHAR(255),
address_street VARCHAR(255),
address_city VARCHAR(255),
address_state CHAR(2),
address_zip CHAR(5),
email VARCHAR(255),
phone VARCHAR(15),
art_preference VARCHAR(255),
project_purchased CHAR(1),
client_ideas VARCHAR(1000),
PRIMARY KEY (ID)
) ENGINE = innodb;

CREATE TABLE project_ideas
(
ID INT AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
type VARCHAR(255),
description VARCHAR(1000),
PRIMARY KEY (ID)
) ENGINE = innodb;

CREATE TABLE materials_used
(
artid INT,
materialsid INT,
amount_used VARCHAR(255),
notes VARCHAR(1000),
FOREIGN KEY (artid) REFERENCES artwork(ID),
FOREIGN KEY (materialsid) REFERENCES materials(ID)
) ENGINE = innodb;

CREATE TABLE sale
(
clientid INT,
artid INT,
date DATE,
Price DECIMAL(6,2),
FOREIGN KEY (clientid) REFERENCES client(ID),
FOREIGN KEY (artid) REFERENCES artwork(ID)
) ENGINE = innodb;


CREATE TABLE comes_from
(
projectid INT,
artid INT,
FOREIGN KEY (projectid) REFERENCES project_ideas(ID),
FOREIGN KEY (artid) REFERENCES artwork(ID)
) ENGINE = innodb;



insert into materials (ID, name, category, cost, location_of_shop, size, general_notes) values 
(1, 'Acrylic Paint', 'Surfaces', 2999.85, 'Storage Rack 2', 'large', 'Dries quickly and is water-soluble'),
(2, 'Oil Paint', 'Drawing Tools', 37.35, 'Storage Rack 2', 'large', 'making it easy to clean up.'),
(3, 'Watercolor Paint', 'Tools & Accessories', 104.85, 'Storage Rack 2', 'medium', null),
(4, 'Charcoal', 'Brushes', 239.85, 'Storage Rack 3', 'medium', null),
(5, 'Graphite Pencils', 'Surfaces', 239.85, 'Storage Rack 4', 'small', null),
(6, 'Pastels', 'Drawing Tools', 299.85, 'Storage Rack 1', 'large', 'Perfect for sketching and shading with deep blacks.'),
(7, 'Colored Pencils', 'Tools & Accessories', 194.85, 'Storage Rack 2', 'large', 'Great for detailed drawings and sketches with different hardness levels.'),
(8, 'Canvas', 'Tools & Accessories', 599.85, 'Storage Rack 4', 'medium', 'A common surface for painting'),
(9, 'Sketchbook', 'Tools & Accessories', 449.85, 'Storage Rack 1', 'small', 'especially for acrylics and oils.'),
(10, 'Paintbrushes', 'Tools & Accessories', 134.85, 'Storage Rack 1', 'large', 'Available in various shapes and sizes for different techniques.'),
(11, 'Palette', 'Tools & Accessories', 599.85, 'Storage Rack 2', 'large', 'Holds artwork while painting or drawing'),
(12, 'Easel', 'Surfaces', 52.35, 'Storage Rack 2', 'large', null),
(13, 'Gesso', 'Tools & Accessories', 34.35, 'Storage Rack 3', 'large', 'Used as a primer to prepare surfaces for painting.'),
(14, 'Mod Podge', 'aints', 49.35, 'Storage Rack 2', 'medium', 'Multi-purpose adhesive and sealer for decoupage and protective finishes.'),
(15, 'Paper', 'Surfaces', 374.85, 'Storage Rack 4', 'medium', 'Dries quickly and is water-soluble'),
(16, 'Clay', 'Tools & Accessories', 29.85, 'Storage Rack 4', 'large', 'making it easy to clean up.'),
(17, 'Markers', 'Paper', 56.85, 'Storage Rack 3', 'small', 'Takes longer to dry and provides rich'),
(18, 'Ink', 'Brushes', 67.35, 'Storage Rack 4', 'small', 'vibrant colors.');

INSERT INTO artwork (ID, name, type, description, anticipated_date, anticipated_cost, status) VALUES
(1, 'Eclipsed Horizons', 'Cubism', 'A dramatic representation of a sun slowly vanishing behind a darkened horizon', '2025-03-30', null, 'P'),
(2, 'Whisper of the Void', 'Surrealism', 'symbolizing the fleeting nature of time.', null, 300.00, 'S'),
(3, 'Celestial Dreams', 'Renaissance', 'A haunting depiction of an empty', '2026-06-01', 449.85, 'A'),
(4, 'Fragments of Time', 'Art Nouveau', 'silent space', null, 74.85, 'S'),
(5, 'Starlit Echoes', 'Abstract Art', 'filled with swirling clouds of color that hint at something unseen.', '2025-09-11', 749.85, 'A'),
(6, 'Veins of the Earth', 'Impressionism', 'This piece transports the viewer into a surreal realm where stars form into human shapes', '2025-09-03', null, 'A'),
(7, 'The Last Sunset', 'Abstract Art', 'dreaming of distant galaxies.', '2025-12-01', 899.85, 'A'),
(8, 'Dancing Shadows', 'Realism', 'Scattered across the canvas are broken clock faces', '2025-03-15', 239.85, 'P'),
(9, 'Ocean of Silence', 'Surrealism', 'each showing a different moment in history', null, 500.00, 'S'),
(10, 'Reflections in Glass', 'Photorealism', 'revealing the fractured concept of time.', null, 599.85, 'S'),
(11, 'Bursting into Color', 'Realism', 'A glowing portrayal of night skies echoing the sounds of distant stars', '2026-02-11', 599.85, 'A'),
(12, 'The Painted Sky', 'Photorealism', 'their light rippling through the darkness.', null, 194.85, 'S'),
(13, 'Midnight Reverie', 'Impressionism', 'Earthy tones interlace to form winding lines that resemble the intricate veins of leaves and rocks', '2025-01-25', null, 'P'),
(14, 'Beneath the Surface', 'Romanticism', 'symbolizing nature’s life force.', '2025-11-23', 899.85, 'A'),
(15, 'Through the Looking Glass', 'Expressionism', 'A breathtaking scene of a world on the brink of ending', '2025-03-15', null, 'P'),
(16, 'The Silent Wind', 'Impressionism', 'with the final rays of the sun reflecting off a calm', '2026-05-01', null, 'A'),
(17, 'Crimson Waves', 'Art Nouveau', 'still sea.', null, 499.85, 'S'),
(18, 'Echoes of the Past', 'Abstract Art', 'Figures appear to move in the shifting light', null, 224.85, 'S'),
(19, 'Frosted Pathways', 'Surrealism', 'their dark silhouettes blending and separating in a rhythmic dance.', '2025-03-10', 374.85, 'P'),
(20, 'The Shattered Mirror', 'Baroque', 'Waves of dark blues and greys roll across the canvas', null, 599.00, 'S'),
(21, 'Breaking Dawn', 'Expressionism', 'evoking a sense of stillness and the profound quiet of deep water.', '2026-01-05', 74.85, 'A'),
(22, 'Fading Memories', 'Surrealism', 'A surreal landscape where a distorted mirror reflects an alternate version of reality', null, 399.85, 'S'),
(23, 'Hazy Days', 'Post-Impressionism', 'blurring the lines of perception.', '2025-03-31', null, 'P'),
(24, 'Under the Veil', 'Art Nouveau', 'A sudden explosion of vibrant hues on a pale canvas', '2025-02-10', 250.00, 'P'),
(25, 'Wings of Destiny', 'Minimalism', 'representing the unpredictable arrival of passion and creativity.', '2025-03-28', null, 'P'),
(26, 'Journey’s End', 'Cubism', 'A vast sky', null, 600.00, 'S'),
(27, 'Moonlit Thoughts', 'Realism', 'streaked with vibrant brushstrokes', '2025-03-01', 104.85, 'P'),
(28, 'Across the Unknown', 'Baroque', 'suggests the emotional intensity of a sunset witnessed from an isolated mountaintop.', null, 175.00, 'S'),
(29, 'Mirage of Hope', 'Romanticism', 'A dreamlike piece capturing the calm', '2025-09-01', 200.00, 'A'),
(30, 'Radiance of the Forgotten', 'Pop Art', 'serene beauty of a starry night', '2025-03-04', 164.85, 'P'),
(31, 'Glimpse of Eternity', 'Surrealism', 'where time seems to stand still.', null, 599.85, 'S'),
(32, 'In Between Worlds', 'Realism', 'Subtle layers of underwater life', '2025-02-20', null, 'P'),
(33, 'The Fall of Autumn', 'Surrealism', 'barely visible beneath the water''s surface', null, 549.85, 'S'),
(34, 'Distant Lands', 'Futurism', 'creating a sense of mystery and depth.', '2025-02-11', null, 'P'),
(35, 'Chains of Infinity', 'Minimalism', 'A distorted reflection of reality', null, 1200.00, 'S'),
(36, 'Fractured Reality', 'Renaissance', 'where shapes and colors are fragmented', '2026-02-10', null, 'A'),
(37, 'Embrace of the Storm', 'Photorealism', 'offering a glimpse into another world.', null, 800.00, 'S'),
(38, 'Dawn of the Dreamer', 'Impressionism', 'A thin', '2026-11-02', null, 'A'),
(39, 'A Symphony of Silence', 'Surrealism', 'flowing veil drapes over soft', null, 300.00, 'S'),
(40, 'The Weight of Colors', 'Pop Art', 'almost indistinguishable forms', '2025-04-15', 449.85, 'A');



insert into client (ID, type, name_first, name_last, address_street, address_city, address_state, address_zip, email, phone, art_preference, project_purchased, client_ideas) values
(1, 'current', 'Forester', 'Scard', '06879 Carpenter Way', 'Fargo', 'ND', '58122', 'fscard0@si.edu', '701-376-0967', 'Futurism', 'N', null),
(2, 'prospective', 'Iago', 'Coxon', '89 Spaight Plaza', 'Fairfax', 'VA', '22036', 'icoxon1@imdb.com', '571-932-4196', 'Cubism', 'Y', null),
(3, 'current', 'Margaretta', 'Benneyworth', '95200 Little Fleur Avenue', 'Cleveland', 'OH', '44191', 'mbenneyworth2@surveymonkey.com', '216-629-2406', 'Impressionism', 'Y', 'Street art installations with interactive elements'),
(4, 'prospective', 'Farley', 'Queyeiro', '5 Farragut Crossing', 'Denver', 'CO', '80291', 'fqueyeiro3@mozilla.org', '303-945-5084', 'Renaissance', 'Y', 'Graffiti-style murals with political messages'),
(5, 'past', 'Frank', 'Vaudin', '21 David Trail', 'Orlando', 'FL', '32819', 'fvaudin4@chronoengine.com', '407-363-3194', 'Renaissance', 'Y', 'Surreal landscapes with floating objects'),
(6, 'prospective', 'Terrel', 'Wankel', '485 Cherokee Way', 'Tampa', 'FL', '33615', 'twankel5@ebay.com', '813-527-9239', 'Futurism', 'Y', 'Surreal landscapes with floating objects'),
(7, 'past', 'Simmonds', 'Hiseman', '2017 Victoria Plaza', 'Orlando', 'FL', '32803', 'shiseman6@wikispaces.com', '321-672-6843', 'Baroque', 'Y', null),
(8, 'past', 'Nicolette', 'Cozby', '6657 Dottie Junction', 'Norwalk', 'CT', '06854', 'ncozby7@alibaba.com', '203-391-9099', 'Futurism', 'Y', null),
(9, 'current', 'Teddy', 'Winchcomb', '3 Cordelia Drive', 'Woburn', 'MA', '01813', 'twinchcomb8@shop-pro.jp', '339-839-1348', 'Expressionism', 'N', null),
(10, 'past', 'Barron', 'Geeritz', '79103 Erie Crossing', 'Philadelphia', 'PA', '19146', 'bgeeritz9@state.tx.us', '267-985-4982', 'Renaissance', 'N', null),
(11, 'past', 'Hadrian', 'Pitrelli', '70934 Crownhardt Hill', 'Dallas', 'TX', '75246', 'hpitrellia@flickr.com', '972-454-1211', 'Impressionism', 'N', null),
(12, 'current', 'Rosalynd', 'Calf', '814 Linden Lane', 'Hialeah', 'FL', '33018', 'rcalfb@salon.com', '305-268-1091', 'Surrealism', 'N', 'Graffiti-style murals with political messages'),
(13, 'past', 'Shaughn', 'Capini', '2 Beilfuss Park', 'Orlando', 'FL', '32868', 'scapinic@naver.com', '407-115-5039', 'Abstract Art', 'Y', null),
(14, 'current', 'Silva', 'Camamile', '39645 2nd Park', 'Houston', 'TX', '77005', 'scamamiled@mit.edu', '214-266-6939', 'Cubism', 'Y', null),
(15, 'current', 'Eran', 'Von Der Empten', '59954 Kings Crossing', 'Savannah', 'GA', '31416', 'evonderemptene@instagram.com', '912-374-6746', 'Realism', 'Y', null),
(16, 'current', 'Natalee', 'Surmeir', '7564 Pierstorff Center', 'Fort Wayne', 'IN', '46814', 'nsurmeirf@businesswire.com', '260-102-9322', 'Baroque', 'N', null),
(17, 'current', 'Bren', 'Bourdon', '01963 Lakewood Gardens Trail', 'Amarillo', 'TX', '79171', 'bbourdong@illinois.edu', '806-629-9258', 'Baroque', 'N', 'Mixed media sculptures exploring themes of identity'),
(18, 'past', 'Gwendolen', 'Clibbery', '00031 Bultman Plaza', 'Hampton', 'VA', '23663', 'gclibberyh@skyrock.com', '757-855-5953', 'Pop Art', 'Y', 'Surreal landscapes with floating objects'),
(19, 'past', 'Egon', 'Riccard', '57421 Corben Hill', 'Hayward', 'CA', '94544', 'ericcardi@sakura.ne.jp', '510-340-2189', 'Surrealism', 'Y', null),
(20, 'current', 'Cass', 'Bradly', '2884 Lighthouse Bay Trail', 'Omaha', 'NE', '68179', 'cbradlyj@prnewswire.com', '402-736-3254', 'Minimalism', 'N', null),
(21, 'prospective', 'Gillan', 'Slogrove', '17 Northwestern Place', 'El Paso', 'TX', '88530', 'gslogrovek@vimeo.com', '915-129-8734', 'Renaissance', 'N', null),
(22, 'current', 'Fairlie', 'Fairman', '9 Rieder Terrace', 'Birmingham', 'AL', '35205', 'ffairmanl@goo.gl', '205-596-0773', 'Surrealism', 'Y', null),
(23, 'prospective', 'Towny', 'Penburton', '26441 Buell Avenue', 'Tucson', 'AZ', '85720', 'tpenburtonm@oaic.gov.au', '520-254-8273', 'Post-Impressionism', 'Y', null),
(24, 'current', 'Hugh', 'Skittreal', '2909 Delladonna Pass', 'Buffalo', 'NY', '14233', 'hskittrealn@spiegel.de', '716-237-9892', 'Surrealism', 'Y', null),
(25, 'current', 'Glory', 'Heiden', '6171 Dahle Parkway', 'Montgomery', 'AL', '36125', 'gheideno@pen.io', '334-513-6973', 'Romanticism', 'Y', 'Street art installations with interactive elements');



insert into project_ideas (ID, title, type, description) values
(1, 'Whispers of Eternity', 'Baroque', 'A soft blend of light and shadow'),
(2, 'The Silent Horizon', 'Cubism', 'capturing the ethereal passage of time'),
(3, 'Beyond the Veil', 'Cubism', 'A tranquil seascape that explores the boundary between dreams and reality'),
(4, 'Midnight Reverie', 'Cubism', 'A mystical journey through layers of memory and illusion'),
(5, 'Dance of the Celestials', 'Expressionism', 'A quiet'),
(6, 'Echoes of the Abyss', 'Baroque', 'meditative piece that captures the essence of solitude under the night sky'),
(7, 'The Last Ember', 'Futurism', 'An energetic movement of celestial bodies'),
(8, 'Moonlit Reverie', 'Impressionism', 'frozen in a dance of light and form'),
(9, 'Veins of Time', 'Cubism', 'A haunting piece that speaks to the depths of the unknown'),
(10, 'The Hidden Path', 'Surrealism', 'A fiery portrayal of the final moments of a dying star'),
(11, 'Fractured Reality', 'Photorealism', 'The stillness of the night ocean reflected under a crescent moon'),
(12, 'Starlight Dreams', 'Surrealism', 'A symbolic depiction of time’s impact on the human condition'),
(13, 'The Painted Sky', 'Photorealism', 'A journey through the forgotten corners of the world'),
(14, 'Through the Shattered Glass', 'Renaissance', 'A surreal landscape where past and present collide'),
(15, 'Infinite Horizon', 'Baroque', 'The soft shimmer of the stars interwoven with the vastness of space'),
(16, 'A Symphony of Colors', 'Cubism', 'A moment of serenity under an expansive sky'),
(17, 'The Floating Garden', 'Cubism', 'The collision of reality and dreams as seen through shattered reflections'),
(18, 'Fragments of Tomorrow', 'Photorealism', 'A landscape where infinity seems within reach'),
(19, 'The Alchemist''s Dream', 'Renaissance', 'A chaotic and harmonious arrangement of color'),
(20, 'Wings of the Fallen', 'Expressionism', 'A whimsical portrayal of life and nature blending into a tranquil garden'),
(21, 'Sunset Serenade', 'abstract painting', 'A vibrant painting of a sunset over the ocean with bold colors and dynamic brushstrokes.'),
(22, 'Whispers of the Wind', 'photorealistic sculpture', 'A surreal sculpture of a figure made entirely of recycled materials'),
(23, 'Midnight Melody', 'surrealistic drawing', 'representing the concept of transformation.'),
(24, 'Dreams of Tomorrow', 'pop art installation', 'An abstract mixed media piece exploring the theme of identity and self-discovery through layers of texture and symbolism.'),
(25, 'Echoes of Eternity', 'impressionist landscape', 'A minimalist black and white photograph capturing the beauty of a single flower in bloom.'),
(26, 'Dancing Shadows', 'minimalist performance art', 'A whimsical collage of vintage magazine clippings and hand-painted elements'),
(27, 'Whimsical Wonder', 'postmodern video art', 'creating a nostalgic and dreamlike atmosphere.'),
(28, 'Enchanted Embrace', 'cubist collage', 'A detailed charcoal drawing of a cityscape at night'),
(29, 'Mystical Mirage', 'futurist mixed media', 'with intricate shading and perspective.'),
(30, 'Celestial Symphony', 'dadaist assemblage', 'A modern installation piece using light and sound to create an immersive sensory experience for the viewer.'),
(31, 'Serenity''s Song', 'realist portrait', 'A conceptual performance art piece involving audience participation and interactive elements.'),
(32, 'Harmony in Chaos', 'expressionist print', 'A series of digital illustrations inspired by nature and mythology'),
(33, 'Ethereal Essence', 'conceptual textile art', 'blending fantasy and reality.'),
(34, 'Infinite Illusion', 'neoclassical architecture', 'A large-scale mural depicting a community coming together to celebrate diversity and unity.'),
(35, 'Radiant Reverie', 'symbolist mural', 'A mixed media assemblage of found objects and personal mementos'),
(36, 'Sunset Serenade', 'abstract painting', 'exploring themes of memory and nostalgia.'),
(37, 'Whispers of the Wind', 'photorealistic sculpture', 'A kinetic sculpture that moves and changes shape in response to the viewer''s movements'),
(38, 'Midnight Melody', 'surrealistic drawing', 'inviting interaction and engagement.'),
(39, 'Dreams of Tomorrow', 'pop art installation', 'A series of abstract paintings inspired by the artist''s emotional journey through grief and healing.'),
(40, 'Echoes of Eternity', 'impressionist landscape', 'A collection of handcrafted pottery pieces inspired by traditional techniques and modern design aesthetics.');



insert into materials_used (artid, materialsid, amount_used, notes) values
(1, 17, 4, 'Acrylic Paint was used to create fast-drying layers on canvas'),
(2, 18, 0, 'Oil Paint provided rich texture and depth in the painting'),
(3, 14, 7, 'Watercolor Paint blended seamlessly to create soft transitions'),
(4, 5, 10, 'Charcoal was used for detailed shading and contrast'),
(5, 1, 1, 'Graphite Pencils created fine lines for intricate sketches'),
(6, 18, 4, 'Pastels were layered to create soft, smooth gradients'),
(7, 9, 0, 'Colored Pencils allowed for precise, detailed shading'),
(8, 9, 6, 'Canvas served as a strong base for acrylic painting'),
(9, 18, 7, 'Sketchbook captured initial ideas with fluidity'),
(10, 3, 4, 'Paintbrushes were used for detailed strokes and blending'),
(11, 5, 7, 'Palette mixed various colors to achieve the desired tones'),
(12, 15, 8, 'Easel held the artwork at the perfect angle for ease of painting'),
(13, 5, 0, 'Gesso was applied as a primer to smooth the surface'),
(14, 2, 10, 'Mod Podge sealed the artwork and added a glossy finish'),
(15, 14, 2, 'Paper was used as a lightweight surface for sketching and drawing'),
(16, 15, 4, 'Clay was molded to form sculptures and textured shapes'),
(17, 8, 4, 'Markers provided sharp, vivid colors for outlining'),
(18, 10, 0, 'Ink was applied for deep, dramatic line work and accents'),
(19, 15, 10, 'Acrylic Paint created smooth, thick layers that enhanced textures'),
(20, 8, 5, 'Oil Paint blended easily to create smooth transitions in color'),
(21, 1, 7, 'Watercolor Paint added a transparent, flowing quality to the artwork'),
(22, 13, 0, 'Charcoal was used for quick sketches and expressive shading'),
(23, 16, 7, 'Graphite Pencils rendered fine details and clean edges'),
(24, 14, 9, 'Pastels provided vibrant, soft color transitions for portraits'),
(25, 12, 2, 'Colored Pencils allowed for cross-hatching and fine line work'),
(26, 11, 1, 'Canvas supported heavy paint applications without warping'),
(27, 9, 4, 'Sketchbook was used to develop early ideas and concepts'),
(28, 10, 4, 'Paintbrushes created various textures depending on bristle types'),
(29, 3, 8, 'Palette was used to mix complementary colors'),
(30, 11, 2, 'Easel ensured stability while working on large canvases'),
(31, 5, 4, 'Gesso provided a smooth surface for applying other materials'),
(32, 10, 2, 'Mod Podge was used for collaging and creating texture on surfaces'),
(33, 1, 2, 'Paper absorbed watercolors effectively, creating soft washes'),
(34, 1, 8, 'Clay allowed for detailed sculptural work and textural effects'),
(35, 17, 2, 'Markers were used to outline and define shapes in the artwork'),
(36, 18, 10, 'Ink was applied to create bold, graphic effects'),
(37, 13, 3, 'Acrylic Paint dried quickly, allowing for faster layering'),
(38, 15, 1, 'Oil Paint’s slow drying time enabled smooth blending and correction'),
(39, 5, 1, 'Watercolor Paint was used for transparent and ethereal effects'),
(40, 10, 10, 'Charcoal provided rich contrast and texture in figure drawing');



insert into sale (artid, clientid, date, price) values
(1, 10, '2021-01-05', 300),
(2, 20, '2023-10-31', 74.85),
(3, 15, '2022-05-16', 500),
(4, 3, '2023-06-25', 599.85),
(5, 5, '2022-07-06', 194.85),
(6, 1, '2023-06-17', 899.85),
(7, 19, '2022-02-21', 499.85),
(8, 16, '2021-08-26', 224.85),
(9, 20, '2021-01-31', 399.85),
(10, 19, '2022-12-14', 549.85),
(11, 15, '2024-03-24', 600),
(12, 7, '2023-11-10', 175),
(13, 9, '2020-10-06', 200),
(14, 8, '2022-09-07', 599.85),
(15, 5, '2020-11-06', 449.85),
(16, 19, '2022-05-21', 300),
(17, 3, '2020-05-21', 599.85),
(18, 16, '2021-06-27', 800),
(19, 8, '2020-10-15', 300),
(20, 5, '2020-05-05', 449.85);



insert into comes_from (artid, projectid) values 
(1, 14),
(1, 10),
(2, 6),
(2, 13),
(3, 17),
(4, 8),
(5, 3),
(6, 20),
(6, 8),
(7, 9),
(8, 13),
(8, 1),
(9, 4),
(10, 12),
(11, 16),
(12, 18),
(13, 5),
(13, 15),
(14, 1),
(15, 7),
(16, 10),
(16, 3),
(17, 2),
(18, 15),
(19, 11),
(20, 19),
(21, 3),
(22, 5),
(23, 17),
(23, 9),
(24, 4),
(25, 6),
(25, 20),
(26, 16),
(27, 8),
(28, 2),
(29, 10),
(29, 6),
(30, 13),
(31, 9),
(32, 14),
(33, 19),
(33, 17),
(34, 11),
(35, 18),
(35, 12),
(36, 7),
(37, 5),
(38, 1),
(39, 12),
(40, 2),
(40, 20);

--All_Inventory--
SELECT * 
FROM materials
ORDER BY category;

--In_Development--
SELECT *
FROM artwork
ORDER BY anticipated_date;


--Previous_Artwork--
SELECT *
FROM artwork
WHERE status = 'S'
ORDER BY name ASC;

--Client_List--
SELECT 
FROM client
ORDER BY name_last ASC;


--Project_Ideas_List--
SELECT title, description
FROM project_ideas
ORDER BY title ASC;


--Available_Artwork_Costs--
SELECT name, type, description, anticipated_date, anticipated_cost, status
FROM artwork
WHERE status != 'S'
ORDER BY name;


--Sales_Per_Client--
SELECT client.name_first, client.name_last, COUNT(sale.artid) AS total_purchases
FROM sale
JOIN client ON sale.clientid = client.ID
ORDER BY client.ID;


--Artworks_From_Idea--
SELECT artwork.name, artwork.type, artwork.description, artwork.anticipated_date
FROM artwork
WHERE artwork.ID IN (
    SELECT artid
    FROM comes_from)
ORDER BY artwork.name;
