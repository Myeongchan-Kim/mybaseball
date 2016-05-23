Ext.require(['Ext.tab.Panel']);

Ext.setup({
    icon: 'icon.png',
    tabletStartupScreen: 'tablet_startup.png',
    phoneStartupScreen: 'phone_startup.png',
    glossOnIcon: false,
    onReady: function() {
        var tabpanel = Ext.create('Ext.tab.Panel', {
            tabBar: {
                docked: 'bottom',
                layout: {
                    pack: 'center'
                }
            },
            fullscreen: true,
            ui: 'light',
            defaults: {
                scrollable: true
            },
            items: [
				{
					title: 'Yemen',
					iconCls: 'info',
					cls: 'home',
					items: {
						xtype: 'toolbar',
						dock: 'top',
						title: 'About Yemen'
					},
                	html: [
					'<img src="./images/tab02.png" width="100%">',
					'<h1 align="center">Arabia Felix : Yemen</h1>',

					'<h2><img src="./images/bullet1.png"> Flag& Emblem: </h2>',
					'<p><img src="./images/flag.jpg"></p>',   

					'<h2><img src="./images/bullet1.png"> Time zone: G.M.T.+3hrs. </h2>',

					'<h2><img src="./images/bullet1.png"> Economy: </h2>',
					'<p>Yemen has adopted an economic policy based on free economy. The market mechanism encourages the private sector giving it a major role in the development of the country\'s economy. The economic policy ensures private ownership, which can not be forfeited except for public interest and then with fair compensation. The investment law has created many investments opportunities and provided incentive to local and foreign investment in all aspects of the economy.</p>',
					
					'<h2><img src="./images/bullet1.png"> Entry Ports: </h2>',
					'<p>It is possible to enter the Republic of Yemen through all international airports of Sana\'a\, Aden\, Al Hodeidah\, al Rayan and Taiz.<br>',
					'You can also inter through the main seaports : Aden port (the free Zone and it is the biggest port in Yemen)\, Al Hodeidah on the Red Sea\, Al Mokha on the Red Sea and Al Mukala on the Arabian Sea.<br>',
					'It is possible to enter to Yemen through land entries\, such as Haradh and Al Buqa\'a in the North (from Saudi Arabia\'s borders) and Hadnut in the East (from Oman\'s borders).</p>', 

					'<h2><img src="./images/bullet1.png"> Currency: </h2>',
					'<p>It is Yemeni Rail(YR) and visitors can exchange currencies in banks and in exchange establishments.</p>', 

					'<h2><img src="./images/bullet1.png"> Religion: </h2>',
					'<p>Islam is the official religion. There is a Jewish minority\, too</p>',

					'<h2><img src="./images/bullet1.png"> POPULATION: 24M  (2010 est.) </h2>',

					'<h2><img src="./images/bullet1.png"> Language: Arabic </h2>',

					'<h2><img src="./images/bullet1.png"> Area: </h2>',
					'<p>The total area of Yemen is approximately 555K km2, excluding Al Rub al-Khali (The Empty Quarter Desert).</p>', 

					'<h2><img src="./images/bullet1.png"> Geographical divisions: </h2>',
					'<p>In view of its topographical structure, the Republic of Yemen is divided into five regions: </p>',  
					'<p>1. Mountain region with heights ranging between 1000-3666m. High </p>',
					'<p>The western mountain range represents a large area of the country. It is the range called Al-Sarat Mountains stretching longitudinally from the north to the south and transversally from the west to the east, which resembles the letter "L". These heights go down in different directions. They descend sharply westwards to the Red Sea\, southwards to the Gulf of Aden and the Arabian Sea\, and eastwards and northwards to the interior desert areas. In the mountain heights\, stretching from the north to the south\, there are a number of basins (beds)\, of considerable agricultural importance with large populations\, such as Sana\'a basin\, Yarim basin\, Jahran flatland\, Sa\'da flatland\, Alboun flatland\, Aqwat Hadhramout bed and Si\'aith bed in Mahara. The most prominent mountains in these heights are the mountains of Attaq\, Bayhan\, Mukairas\, Al-Dhalie\'\, Yafie\'\, Sabra\, Hadhour Alsheikh\, Miswar and Prophet Shu\'aib which at 3766m above sea level is the highest mountain in Arabia.</p>',

					'<p>2. The Highland region <p>',
					'<p>This area lies to the east and north of the mountainous heights going in parallel to the heights towards the Empty Quarter. The maximum height of this area is 1000m gradually descending. Such area is represented by the highlands in Sana\'a\, Al-Jouf\, Shabwa\, Hadhramout and Mahara. The out-skirts of this area in the north overlap with the Empty Quarter. </p>',


					'<p>3. The Coastal Area </p>',
					'<p>This area includes the coastal plains overlooking the Red Sea, Gulf of Aden and Arabian Sea. They are connected to each other forming a coastal strip that extends from the Oman border south- westward to Bab Al-Mandab. This strip then changes its direction northward to the borders of Saudi Arabia, thus making it more than 2400km. long. The width of the plains ranges from 30 to 60 km. </p>',

					'<p>4. The Empty Quarter </p>',
					'<p>This area consists of desert plains covered with gravel, sand and sandy dunes, Evolving in some parts desert plants and vast oases that were formed due to the collection of the seasonal water. The wandering nomads because of its pastoral land inhabit it.</p>',

					'<p>5. The Yemeni Islands </p>',
					'<p>This part of the country consists of islands scattered along the coast of Yemen. There are 120 islands, most of which are located in the Red Sea. The biggest islands are Kamaran, Greater Hannish, Minor Hannish, and the rest of Archipelago, Zaqar, Zubair, AL-Tayr and the strategic island of Meon at the Bab Al-Mandeb. In addition there are islands located in the Gulf of Aden and the Arabian Sea, the largest of which is Soqotra.</p>',

					'<h2><img src="./images/bullet1.png"> Climate: </h2>',
					'<p>Since Yemen is endowed with a varied topography, the climate\, in general\, also varies\, although there are no major seasonal differences. We can say there are two long seasons\: summer and winter during summer\, the temperature and humidity are high in the coastal areas\, while the climate is moderate during winter. From time to time the rainfall\, due to the monsoon\, moderates the temperature over the coastal areas in summer. In the mountain areas\, the weather is moderate in summer and cold in winter during the night and in the early morning\, but the bright sunrays raise the temperature during the day making the weather very moderate in these parts of the country.</p>',

					'<h2><img src="./images/bullet1.png"> Location: </h2>',
					'<p>The Republic of Yemen lies in the South of Arabia (The Arabian Peninsula)\, south-west of Asia, between latitudes 12 and 20 degrees to the north of the equator, and between longitudes 41and 54 degrees to the south of Greenwich, bordered on the north by Saudi Arabia\, on the south by the Arab Sea and the Gulf of Aden\, on the east by the Sultanate of Oman and on the west by the Red Sea.</p>',					

					'<p>source: www.yementourism.com</p>'
					].join("")
				},
                {
                    title: 'Project',
					items: {
						xtype: 'toolbar',
						dock: 'top',
						title: 'About Project'
					},
                    html: [
					'<img src="./images/intro.png" width="100%">',
					'<h1 align="center">ICT Business Incubating Project</h1>',
					'<h2>1. VISION</h2>',
					'<p>- Incubation Small Business in ICT Industry.<br>',
					'- Training ICT Youth Leaders.<br>', 
					'- Supporting that establishing Incubator in Local Organization.</p>',

					'<h2>2. AIMS</h2>', 
					'<p>- Train Youth Groups who are interested in ICT Business Skill and New Techniques. <br>',
					'- Support trained groups to start their own Small ICT Business in Yemen. <br>',
					'- Establish ICT Business Incubator in Yemen. <br>',
					'- Build Relationship between Korean ICT Organization and Yemeni ICT Organization.</p>',

					'<h2>3. Supervision : ITIRC(www.itircyemen.com)</h2>',

					'<h2>4. Project Phase(T-R-A-D-E)</h2>', 
					'<p>- Phase 1(T) : Training ICT and Business Skills.<br>', 
					'- Phase 2(R) : Research ICT Market in Yemen \& MENA Region. <br>',
					'- Phase 3(A) : Adopt Business Models and Make Products.<br>', 
					'- Phase 4(D) : Deploy and Manage New Business. <br>',
					'- Phase 5(E) : Enhance(Enlarge) Business by establishing ICT Business Incubator.</p>',

					'<h2>5. Expected Outcomes</h2>', 
					'<p>- All Trained Students will be able to design suitable business model in ICT industry in Yemen and Middle-East and also have a good entrepreneurship. <br>',
					'- On/Off-Line ICT Community between workers in ICT Industry will be formed. <br>',
					'- ICT Business Incubator in Yemen will be established and Incubator will be able to manage Business Incubators.</p>'
					].join(""),
                    iconCls: 'favorites',
                    cls: 'home'
                },
                {
                    title: 'Training',
					items: {
						xtype: 'toolbar',
						dock: 'top',
						title: 'About Training'
					},
                    html: [
						'<img src="./images/tab01.png" width="100%">',
						'<h1 align="center">ITIRC-YEMEN Training Program</h1>',
						'<h2><img src="./images/bullet1.png"> (IT-01)Benchmarking ICT-KOREA </h2>',
						'<h3>1. Aims </h3>',
						'<p>- All trainees will understand ICT Industry and veries Business Models from Experiences of ICT-KOREA. <br>',
						'- All trainees will be able to design suitable business model in ICT industry in Yemen and also have a good entrepreneurship. </p>',
						'<h3>2. Duration : </h3>',
						'<p>- 1 Year (S-I (16weeks) / S-2 (16 Weeks)) </p>',
						'<h3>3. Subjects : </h3>',
						'<p>- Research \& Benchmarking References</p>',

						'<h2><img src="./images/bullet1.png"> (IT-02)Mobile Business</h2>',
						'<h3>1. Aims </h3>',
						'<p>- All trainee will be able to design mobile business model for MENA Region. </p>', 
						'<h3>2. Duration : 2 Month </h3>',
						'<h3>3. Subjects : Mobile Business Model Research for MENA Region </h3>',

						'<h2><img src="./images/bullet1.png"> (IT-03)Mobile Web Programming</h2>',
						'<h3>1. Aims </h3>',
						'<p>- All trainee will be able to develop Mobile Web Site. </p>', 
						'<h3>2. Duration : 3 Month (Basic Level) </h3>',
						'<h3>3. Subjects : Sencha Touch\, JQuery Mobile </h3>',
												
						'<h2><img src="./images/bullet1.png"> (IT-04)iOS Programing </h2>',
						'<h3>1. Aims </h3>',
						'<p>- All trainees will be able to develop iOS Apps. </p>', 
						'<h3>2. Duration : 3 Months (Basic Level) </h3>',
						'<h3>3. Subjects : iOS SDK\, Objective-C\, XCode </h3>',
			
						'<h2><img src="./images/bullet1.png"> (IT-05)Mac OS X</h2>',
						'<h3>1. Aims </h3>',
						'<p>- All trainee will be able to operate Mac OS X and related applications. </p>', 
						'<h3>2. Duration : 1 Month </h3>',
						'<h3>3. Subjects : OS X Basic\, keynote </h3>'
					].join(""),
                    iconCls: 'bookmarks',
                    cls: 'home'
                },
                {
                    title: 'Support',
					items: {
						xtype: 'toolbar',
						dock: 'top',
						title: 'Support Network'
					},
                    html: [
						'<img src="./images/tab03.png" width="100%">',
						'<h2>You can support in YEMEN ICT Small Business Incubating Project as follows.</h2>',

						'<h2><img src="./images/bullet2.png"> Indivisual support </h2>',
						'<p>- Consultation about ICT Technologies and ICT Business. <br>',
						"- Share Technical Skills and Training Support in One's Specialty.</p>",

						'<h2><img src="./images/bullet2.png"> Support as a Company </h2>',
						'<p>- Forming Partnership in ICT Business and Technical support. <br>',
						'- Forming Partnership in pioneering Yemen and Arab ICT Market. <br>',
						'- Forming Partnership in Arabic Localization. <br>',
						'- Employ Trainee in Business(Outsourcing).</p>',

						'<h2><img src="./images/bullet2.png"> Support as a Business Incubator</h2>', 
						'<p>- Consultation about managing a business incubator by establishment of sisterhood relationship. </br>',
						'- Support in management of a Business Incubator.</p>',

						'<h2><img src="./images/bullet2.png"> Support as a governmental institution or NGO</h2>', 
						'<p>- Consultation about improvement of social system for revitalization of local Business. <br>',
						'- Support running a Business Incubator. <br>',
						'- Support micro-financing for start-ups.</p>',

						"<h2><i>If you'd like to support with ITIRC-YEMEN ICT Small Business Incubating Project,<br>",
						'Contact Us, e-mail <a href="mailto:itircyemen@gmail.com">itircyemen</a>',
						' or call(+967-711-532-909, ITIRC-YEMEN Representative)</a></i></h2>'
					].join(""),
                    cls: 'home',
                    iconCls: 'team'
                },
				{
					title: 'Contact',
					iconCls: 'user',
					cls: 'home',
					items: {
						xtype: 'toolbar',
						dock: 'top',
						title: 'Contact Us'
					},
                    html: [
					'<img src="./images/tab04.png" width="100%">',
					'<h1 align="center">Contact Us</h1>',
					'<h2>- ITIRC-YEMEN Representative</h2>', 
					'<h2>- Tel. : +967-711-532-909</h2>',
					'<h2>- E-mail : <a href="mailto:itircyemen@gmail.com">itircyemen@gmail.com</a></h2>'
					].join("")
				}				
            ]
        });
    }
});