USE ChimuraTest;

CREATE TABLE Language(
    ID INT UNSIGNED NOT NULL, -- Not automatically incremented!
    Abreviation VARCHAR(2) NOT NULL,
    Name varchar(100) NOT NULL, -- Longest is apparently 80, but by precaution, I prefer it higher.
    Supported bit NOT NULL,
    
    PRIMARY KEY(ID),
    UNIQUE(Abreviation),
    UNIQUE(Name)
) ENGINE=INNODB;

INSERT INTO Language
VALUES
    (1, 'ab', 'Abkhazian', 0),
    (2, 'aa', 'Afar', 0),
    (3, 'af', 'Afrikaans', 0),
    (4, 'ak', 'Akan', 0),
    (5, 'sq', 'Albanian', 0),
    (6, 'am', 'Amharic', 0),
    (7, 'ar', 'Arabic', 0),
    (8, 'an', 'Aragonese', 0),
    (9, 'hy', 'Armenian', 0),
    (10, 'as', 'Assamese', 0),
    (11, 'av', 'Avaric', 0),
    (12, 'ae', 'Avestan', 0),
    (13, 'ay', 'Aymara', 0),
    (14, 'az', 'Azerbaijani', 0),
    (15, 'bm', 'Bambara', 0),
    (16, 'ba', 'Bashkir', 0),
    (17, 'eu', 'Basque', 0),
    (18, 'be', 'Belarusian', 0),
    (19, 'bn', 'Bengali', 0),
    (20, 'bi', 'Bislama', 0),
    (21, 'bs', 'Bosnian', 0),
    (22, 'br', 'Breton', 0),
    (23, 'bg', 'Bulgarian', 0),
    (24, 'my', 'Burmese', 0),
    (25, 'ca', 'Catalan, Valencian', 0),
    (26, 'km', 'Central Khmer', 0),
    (27, 'ch', 'Chamorro', 0),
    (28, 'ce', 'Chechen', 0),
    (29, 'ny', 'Chichewa, Chewa, Nyanja', 0),
    (30, 'zh', 'Chinese', 0),
    (31, 'cu', 'Church Slavic, Old Slavonic, Church Slavonic, Old Bulgarian, Old Church Slavonic', 0),
    (32, 'cv', 'Chuvash', 0),
    (33, 'kw', 'Cornish', 0),
    (34, 'co', 'Corsican', 0),
    (35, 'cr', 'Cree', 0),
    (36, 'hr', 'Croatian', 0),
    (37, 'cs', 'Czech', 0),
    (38, 'da', 'Danish', 0),
    (39, 'dv', 'Divehi, Dhivehi, Maldivian', 0),
    (40, 'nl', 'Dutch, Flemish', 0),
    (41, 'dz', 'Dzongkha', 0),
    (42, 'en', 'English', 1),
    (43, 'eo', 'Esperanto', 0),
    (44, 'et', 'Estonian', 0),
    (45, 'ee', 'Ewe', 0),
    (46, 'fo', 'Faroese', 0),
    (47, 'fj', 'Fijian', 0),
    (48, 'fi', 'Finnish', 0),
    (49, 'fr', 'French', 0),
    (50, 'ff', 'Fulah', 0),
    (51, 'gd', 'Gaelic, Scottish Gaelic', 0),
    (52, 'gl', 'Galician', 0),
    (53, 'lg', 'Ganda', 0),
    (54, 'ka', 'Georgian', 0),
    (55, 'de', 'German', 0),
    (56, 'el', 'Greek', 0),
    (57, 'gn', 'Guarani', 0),
    (58, 'gu', 'Gujarati', 0),
    (59, 'ht', 'Haitian, Haitian Creole', 0),
    (60, 'ha', 'Hausa', 0),
    (61, 'he', 'Hebrew', 0),
    (62, 'hz', 'Herero', 0),
    (63, 'hi', 'Hindi', 0),
    (64, 'ho', 'Hiri Motu', 0),
    (65, 'hu', 'Hungarian', 0),
    (66, 'is', 'Icelandic', 0),
    (67, 'io', 'Ido', 0),
    (68, 'ig', 'Igbo', 0),
    (69, 'id', 'Indonesian', 0),
    (70, 'ia', 'Interlingua (International Auxiliary Language Association)', 0),
    (71, 'ie', 'Interlingue, Occidental', 0),
    (72, 'iu', 'Inuktitut', 0),
    (73, 'ik', 'Inupiaq', 0),
    (74, 'ga', 'Irish', 0),
    (75, 'it', 'Italian', 0),
    (76, 'ja', 'Japanese', 0),
    (77, 'jv', 'Javanese', 0),
    (78, 'kl', 'Kalaallisut, Greenlandic', 0),
    (79, 'kn', 'Kannada', 0),
    (80, 'kr', 'Kanuri', 0),
    (81, 'ks', 'Kashmiri', 0),
    (82, 'kk', 'Kazakh', 0),
    (83, 'ki', 'Kikuyu, Gikuyu', 0),
    (84, 'rw', 'Kinyarwanda', 0),
    (85, 'ky', 'Kirghiz, Kyrgyz', 0),
    (86, 'kv', 'Komi', 0),
    (87, 'kg', 'Kongo', 0),
    (88, 'ko', 'Korean', 0),
    (89, 'kj', 'Kuanyama, Kwanyama', 0),
    (90, 'ku', 'Kurdish', 0),
    (91, 'lo', 'Lao', 0),
    (92, 'la', 'Latin', 0),
    (93, 'lv', 'Latvian', 0),
    (94, 'li', 'Limburgan, Limburger, Limburgish', 0),
    (95, 'ln', 'Lingala', 0),
    (96, 'lt', 'Lithuanian', 0),
    (97, 'lu', 'Luba-Katanga', 0),
    (98, 'lb', 'Luxembourgish, Letzeburgesch', 0),
    (99, 'mk', 'Macedonian', 0),
    (100, 'mg', 'Malagasy', 0),
    (101, 'ms', 'Malay', 0),
    (102, 'ml', 'Malayalam', 0),
    (103, 'mt', 'Maltese', 0),
    (104, 'gv', 'Manx', 0),
    (105, 'mi', 'Maori', 0),
    (106, 'mr', 'Marathi', 0),
    (107, 'mh', 'Marshallese', 0),
    (108, 'mn', 'Mongolian', 0),
    (109, 'na', 'Nauru', 0),
    (110, 'nv', 'Navajo, Navaho', 0),
    (111, 'ng', 'Ndonga', 0),
    (112, 'ne', 'Nepali', 0),
    (113, 'nd', 'North Ndebele', 0),
    (114, 'se', 'Northern Sami', 0),
    (115, 'no', 'Norwegian', 0),
    (116, 'nb', 'Norwegian Bokm??l', 0),
    (117, 'nn', 'Norwegian Nynorsk', 0),
    (118, 'oc', 'Occitan', 0),
    (119, 'oj', 'Ojibwa', 0),
    (120, 'or', 'Oriya', 0),
    (121, 'om', 'Oromo', 0),
    (122, 'os', 'Ossetian, Ossetic', 0),
    (123, 'pi', 'Pali', 0),
    (124, 'ps', 'Pashto, Pushto', 0),
    (125, 'fa', 'Persian', 0),
    (126, 'pl', 'Polish', 0),
    (127, 'pt', 'Portuguese', 0),
    (128, 'pa', 'Punjabi, Panjabi', 0),
    (129, 'qu', 'Quechua', 0),
    (130, 'ro', 'Romanian, Moldavian, Moldovan', 0),
    (131, 'rm', 'Romansh', 0),
    (132, 'rn', 'Rundi', 0),
    (133, 'ru', 'Russian', 0),
    (134, 'sm', 'Samoan', 0),
    (135, 'sg', 'Sango', 0),
    (136, 'sa', 'Sanskrit', 0),
    (137, 'sc', 'Sardinian', 0),
    (138, 'sr', 'Serbian', 0),
    (139, 'sn', 'Shona', 0),
    (140, 'ii', 'Sichuan Yi, Nuosu', 0),
    (141, 'sd', 'Sindhi', 0),
    (142, 'si', 'Sinhala, Sinhalese', 0),
    (143, 'sk', 'Slovak', 0),
    (144, 'sl', 'Slovenian', 0),
    (145, 'so', 'Somali', 0),
    (146, 'nr', 'South Ndebele', 0),
    (147, 'st', 'Southern Sotho', 0),
    (148, 'es', 'Spanish, Castilian', 0),
    (149, 'su', 'Sundanese', 0),
    (150, 'sw', 'Swahili', 0),
    (151, 'ss', 'Swati', 0),
    (152, 'sv', 'Swedish', 0),
    (153, 'tl', 'Tagalog', 0),
    (154, 'ty', 'Tahitian', 0),
    (155, 'tg', 'Tajik', 0),
    (156, 'ta', 'Tamil', 0),
    (157, 'tt', 'Tatar', 0),
    (158, 'te', 'Telugu', 0),
    (159, 'th', 'Thai', 0),
    (160, 'bo', 'Tibetan', 0),
    (161, 'ti', 'Tigrinya', 0),
    (162, 'to', 'Tonga (Tonga Islands)', 0),
    (163, 'ts', 'Tsonga', 0),
    (164, 'tn', 'Tswana', 0),
    (165, 'tr', 'Turkish', 0),
    (166, 'tk', 'Turkmen', 0),
    (167, 'tw', 'Twi', 0),
    (168, 'ug', 'Uighur, Uyghur', 0),
    (169, 'uk', 'Ukrainian', 0),
    (170, 'ur', 'Urdu', 0),
    (171, 'uz', 'Uzbek', 0),
    (172, 've', 'Venda', 0),
    (173, 'vi', 'Vietnamese', 0),
    (174, 'vo', 'Volap??k', 0),
    (175, 'wa', 'Walloon', 0),
    (176, 'cy', 'Welsh', 0),
    (177, 'fy', 'Western Frisian', 0),
    (178, 'wo', 'Wolof', 0),
    (179, 'xh', 'Xhosa', 0),
    (180, 'yi', 'Yiddish', 0),
    (181, 'yo', 'Yoruba', 0),
    (182, 'za', 'Zhuang, Chuang', 0),
    (183, 'zu', 'Zulu', 0)
;