class Country {
  String countryCode;
  String name;
  String countryFlag ;

  Country(this.countryCode, this.name,this.countryFlag);

  static List<Country> getCountries() {
    return <Country>[
      Country('ABW', 'Aruba', 'ar'),
      Country('AFG', 'Afghanistan', 'af'),
      Country('AGO', 'Angola', 'ao'),
      Country('AIA', 'Anguilla', 'ai'),
      Country('ALA', 'Åland Islands', 'ax'),
      Country('ALB', 'Albania', 'al'),
      Country('AND', 'Andorra', 'ad'),
      Country('ARE', 'United Arab Emirates', 'ae'),
      Country('ARG', 'Argentina', 'ar'),
      Country('ARM', 'Armenia', 'am'),
      Country('ASM', 'American Samoa', 'as'),
      Country('ATA', 'Antarctica', 'aq'),
      Country('ATF', 'French Southern Territories', 'tf'),
      Country('ATG', 'Antigua and Barbuda', 'ag'),
      Country('AUS', 'Australia', 'au'),
      Country('AUT', 'Austria', 'at'),
      Country('AZE', 'Azerbaijan', 'az'),
      Country('BDI', 'Burundi', 'bi'),
      Country('BEL', 'Belgium', 'be'),
      Country('BEN', 'Benin', 'bj'),
      Country('BES', 'Bonaire, Sint Eustatius and Saba', 'bq'),
      Country('BFA', 'Burkina Faso', 'bf'),
      Country('BGD', 'Bangladesh', 'bd'),
      Country('BGR', 'Bulgaria', 'bg'),
      Country('BHR', 'Bahrain', 'bh'),
      Country('BHS', 'Bahamas', 'bs'),
      Country('BIH', 'Bosnia and Herzegovina', 'ba'),
      Country('BLM', 'Saint Barthélemy', 'bl'),
      Country('BLR', 'Belarus', 'by'),
      Country('BLZ', 'Belize', 'bz'),
      Country('BMU', 'Bermuda', 'bm'),
      Country('BOL', 'Bolivia (Plurinational State of)', 'bo'),
      Country('BRA', 'Brazil', 'br'),
      Country('BRB', 'Barbados', 'bb'),
      Country('BRN', 'Brunei Darussalam', 'bn'),
      Country('BTN', 'Bhutan', 'bt'),
      Country('BVT', 'Bouvet Island', 'bv'),
      Country('BWA', 'Botswana', 'bw'),
      Country('CAF', 'Central African Republic', 'cf'),
      Country('CAN', 'Canada', 'ca'),
      Country('CCK', 'Cocos (Keeling) Islands', 'cc'),
      Country('CHE', 'Switzerland', 'ch'),
      Country('CHL', 'Chile', 'cl'),
      Country('CHN', 'China', 'cn'),
      Country('CIV', 'Côte d\'Ivoire', 'ci'),
      Country('CMR', 'Cameroon', 'cm'),
      Country('COD', 'Congo, Democratic Republic of the', 'cd'),
      Country('COG', 'Congo', 'cg'),
      Country('COK', 'Cook Islands', 'ck'),
      Country('COL', 'Colombia', 'co'),
      Country('COM', 'Comoros', 'km'),
      Country('CPV', 'Cabo Verde', 'cv'),
      Country('CRI', 'Costa Rica', 'cr'),
      Country('CUB', 'Cuba', 'cu'),
      Country('CUW', 'Curaçao', 'cw'),
      Country('CXR', 'Christmas Island', 'cx'),
      Country('CYM', 'Cayman Islands', 'ky'),
      Country('CYP', 'Cyprus', 'cy'),
      Country('CZE', 'Czechia', 'cz'),
      Country('DEU', 'Germany', 'de'),
      Country('DJI', 'Djibouti', 'dj'),
      Country('DMA', 'Dominica', 'dm'),
      Country('DNK', 'Denmark', 'dk'),
      Country('DOM', 'Dominican Republic', 'do'),
      Country('DZA', 'Algeria', 'dz'),
      Country('ECU', 'Ecuador', 'ec'),
      Country('EGY', 'Egypt', 'eg'),
      Country('ERI', 'Eritrea', 'er'),
      Country('ESH', 'Western Sahara', 'eh'),
      Country('ESP', 'Spain', 'es'),
      Country('EST', 'Estonia', 'ee'),
      Country('ETH', 'Ethiopia', 'et'),
      Country('FIN', 'Finland', 'fi'),
      Country('FJI', 'Fiji', 'fj'),
      Country('FLK', 'Falkland Islands (Malvinas)', 'fk'),
      Country('FRA', 'France', 'fr'),
      Country('FRO', 'Faroe Islands', 'fo'),
      Country('FSM', 'Micronesia (Federated States of)', 'fm'),
      Country('GAB', 'Gabon', 'ga'),
      Country('GBR', 'United Kingdom of Great Britain and Northern Ireland', 'gb'),
      Country('GEO', 'Georgia', 'ge'),
      Country('GGY', 'Guernsey', 'gg'),
      Country('GHA', 'Ghana', 'gh'),
      Country('GIB', 'Gibraltar', 'gi'),
      Country('GIN', 'Guinea', 'gn'),
      Country('GLP', 'Guadeloupe', 'gp'),
      Country('GMB', 'Gambia', 'gm'),
      Country('GNB', 'Guinea-Bissau', 'gw'),
      Country('GNQ', 'Equatorial Guinea', 'gq'),
      Country('GRC', 'Greece', 'gr'),
      Country('GRD', 'Grenada', 'gd'),
      Country('GRL', 'Greenland', 'gl'),
      Country('GTM', 'Guatemala', 'gt'),
      Country('GUF', 'French Guiana', 'gf'),
      Country('GUM', 'Guam', 'gu'),
      Country('GUY', 'Guyana', 'gy'),
      Country('HKG', 'Hong Kong', 'hk'),
      Country('HMD', 'Heard Island and McDonald Islands', 'hm'),
      Country('HND', 'Honduras', 'hn'),
      Country('HRV', 'Croatia', 'hr'),
      Country('HTI', 'Haiti', 'ht'),
      Country('HUN', 'Hungary', 'hu'),
      Country('IDN', 'Indonesia', 'id'),
      Country('IMN', 'Isle of Man', 'im'),
      Country('IND', 'India', 'in'),
      Country('IOT', 'British Indian Ocean Territory', 'io'),
      Country('IRL', 'Ireland', 'ie'),
      Country('IRN', 'Iran (Islamic Republic of)', 'ir'),
      Country('IRQ', 'Iraq', 'iq'),
      Country('ISL', 'Iceland', 'is'),
      Country('ISR', 'Israel', 'il'),
      Country('ITA', 'Italy', 'it'),
      Country('JAM', 'Jamaica', 'jm'),
      Country('JEY', 'Jersey', 'je'),
      Country('JOR', 'Jordan', 'jo'),
      Country('JPN', 'Japan', 'jp'),
      Country('KAZ', 'Kazakhstan', 'kz'),
      Country('KEN', 'Kenya', 'ke'),
      Country('KGZ', 'Kyrgyzstan', 'kg'),
      Country('KHM', 'Cambodia', 'kh'),
      Country('KIR', 'Kiribati', 'ki'),
      Country('KNA', 'Saint Kitts and Nevis', 'kn'),
      Country('KOR', 'Korea, Republic of', 'kr'),
      Country('KWT', 'Kuwait', 'kw'),
      Country('LAO', 'Lao People\'s Democratic Republic', 'la'),
      Country('LBN', 'Lebanon', 'lb'),
      Country('LBR', 'Liberia', 'lr'),
      Country('LBY', 'Libya', 'ly'),
      Country('LCA', 'Saint Lucia', 'lc'),
      Country('LIE', 'Liechtenstein', 'li'),
      Country('LKA', 'Sri Lanka', 'lk'),
      Country('LSO', 'Lesotho', 'ls'),
      Country('LTU', 'Lithuania', 'lt'),
      Country('LUX', 'Luxembourg', 'lu'),
      Country('LVA', 'Latvia', 'lv'),
      Country('MAC', 'Macao', 'mo'),
      Country('MAF', 'Saint Martin (French part)', 'mf'),
      Country('MAR', 'Morocco', 'ma'),
      Country('MCO', 'Monaco', 'mc'),
      Country('MDA', 'Moldova, Republic of', 'md'),
      Country('MDG', 'Madagascar', 'mg'),
      Country('MDV', 'Maldives', 'mv'),
      Country('MEX', 'Mexico', 'mx'),
      Country('MHL', 'Marshall Islands', 'mh'),
      Country('MKD', 'North Macedonia', 'mk'),
      Country('MLI', 'Mali', 'ml'),
      Country('MLT', 'Malta', 'mt'),
      Country('MMR', 'Myanmar', 'mm'),
      Country('MNE', 'Montenegro', 'me'),
      Country('MNG', 'Mongolia', 'mn'),
      Country('MNP', 'Northern Mariana Islands', 'mp'),
      Country('MOZ', 'Mozambique', 'mz'),
      Country('MRT', 'Mauritania', 'mr'),
      Country('MSR', 'Montserrat', 'ms'),
      Country('MTQ', 'Martinique', 'mq'),
      Country('MUS', 'Mauritius', 'mu'),
      Country('MWI', 'Malawi', 'mw'),
      Country('MYS', 'Malaysia', 'my'),
      Country('MYT', 'Mayotte', 'yt'),
      Country('NAM', 'Namibia', 'na'),
      Country('NCL', 'New Caledonia', 'nc'),
      Country('NER', 'Niger', 'ne'),
      Country('NFK', 'Norfolk Island', 'nf'),
      Country('NGA', 'Nigeria', 'ng'),
      Country('NIC', 'Nicaragua', 'ni'),
      Country('NIU', 'Niue', 'nu'),
      Country('NLD', 'Netherlands, Kingdom of the', 'nl'),
      Country('NOR', 'Norway', 'no'),
      Country('NPL', 'Nepal', 'np'),
      Country('NRU', 'Nauru', 'nr'),
      Country('NZL', 'New Zealand', 'nz'),
      Country('OMN', 'Oman', 'om'),
      Country('PAK', 'Pakistan', 'pk'),
      Country('PAN', 'Panama', 'pa'),
      Country('PCN', 'Pitcairn', 'pn'),
      Country('PER', 'Peru', 'pe'),
      Country('PHL', 'Philippines', 'ph'),
      Country('PLW', 'Palau', 'pw'),
      Country('PNG', 'Papua New Guinea', 'pg'),
      Country('POL', 'Poland', 'pl'),
      Country('PRI', 'Puerto Rico', 'pr'),
      Country('PRK', 'Korea (Democratic People\'s Republic of)', 'kp'),
      Country('PRT', 'Portugal', 'pt'),
      Country('PRY', 'Paraguay', 'py'),
      Country('PSE', 'Palestine, State of', 'ps'),
      Country('PYF', 'French Polynesia', 'pf'),
      Country('QAT', 'Qatar', 'qa'),
      Country('REU', 'Réunion', 're'),
      Country('ROU', 'Romania', 'ro'),
      Country('RUS', 'Russian Federation', 'ru'),
      Country('RWA', 'Rwanda', 'rw'),
      Country('SAU', 'Saudi Arabia', 'sa'),
      Country('SDN', 'Sudan', 'sd'),
      Country('SEN', 'Senegal', 'sn'),
      Country('SGP', 'Singapore', 'sg'),
      Country('SGS', 'South Georgia and the South Sandwich Islands', 'gs'),
      Country('SHN', 'Saint Helena, Ascension and Tristan da Cunha', 'sh'),
      Country('SJM', 'Svalbard and Jan Mayen', 'sj'),
      Country('SLB', 'Solomon Islands', 'sb'),
      Country('SLE', 'Sierra Leone', 'sl'),
      Country('SLV', 'El Salvador', 'sv'),
      Country('SMR', 'San Marino', 'sm'),
      Country('SOM', 'Somalia', 'so'),
      Country('SPM', 'Saint Pierre and Miquelon', 'pm'),
      Country('SRB', 'Serbia', 'rs'),
      Country('SSD', 'South Sudan', 'ss'),
      Country('STP', 'Sao Tome and Principe', 'st'),
      Country('SUR', 'Suriname', 'sr'),
      Country('SVK', 'Slovakia', 'sk'),
      Country('SVN', 'Slovenia', 'si'),
      Country('SWE', 'Sweden', 'se'),
      Country('SWZ', 'Eswatini', 'sz'),
      Country('SXM', 'Sint Maarten (Dutch part)', 'sx'),
      Country('SYC', 'Seychelles', 'sc'),
      Country('SYR', 'Syrian Arab Republic', 'sy'),
      Country('TCA', 'Turks and Caicos Islands', 'tc'),
      Country('TCD', 'Chad', 'td'),
      Country('TGO', 'Togo', 'tg'),
      Country('THA', 'Thailand', 'th'),
      Country('TJK', 'Tajikistan', 'tj'),
      Country('TKL', 'Tokelau', 'tk'),
      Country('TKM', 'Turkmenistan', 'tm'),
      Country('TLS', 'Timor-Leste', 'tl'),
      Country('TON', 'Tonga', 'to'),
      Country('TTO', 'Trinidad and Tobago', 'tt'),
      Country('TUN', 'Tunisia', 'tn'),
      Country('TUR', 'Türkiye', 'tr'),
      Country('TUV', 'Tuvalu', 'tv'),
      Country('TWN', 'Taiwan, Province of China', 'tw'),
      Country('TZA', 'Tanzania, United Republic of', 'tz'),
      Country('UGA', 'Uganda', 'ug'),
      Country('UKR', 'Ukraine', 'ua'),
      Country('UMI', 'United States Minor Outlying Islands', 'um'),
      Country('URY', 'Uruguay', 'uy'),
      Country('USA', 'United States of America', 'us'),
      Country('UZB', 'Uzbekistan', 'uz'),
      Country('VAT', 'Holy See', 'va'),
      Country('VCT', 'Saint Vincent and the Grenadines', 'vc'),
      Country('VEN', 'Venezuela (Bolivarian Republic of)', 've'),
      Country('VGB', 'Virgin Islands (British)', 'vg'),
      Country('VIR', 'Virgin Islands (U.S.)', 'vi'),
      Country('VNM', 'Viet Nam', 'vn'),
      Country('VUT', 'Vanuatu', 'vu'),
      Country('WLF', 'Wallis and Futuna', 'wf'),
      Country('WSM', 'Samoa', 'ws'),
      Country('YEM', 'Yemen', 'ye'),
      Country('ZAF', 'South Africa', 'za'),
      Country('ZMB', 'Zambia', 'zm'),
      Country('ZWE', 'Zimbabwe', 'zw'),
    ];
  }/*
  static List<Country> getCountries() {
    return <Country>[
      Country('SYP', 'Syria','sy'),
      Country('LBP', 'lebanon','lb'),
      Country('EGP', 'Egypt','eg'),
      Country('JOD', 'Jordan','jo'),
      Country('SAR', 'Saudi Arabia','sa'),
      Country('KWD', 'Kuwait','kw'),
      Country('AED', 'Emirate','ae'),
      Country('IQD', 'Iraq','iq'),

    ];
  }*/
}