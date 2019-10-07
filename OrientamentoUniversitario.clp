(defglobal ?*idattr* = 0)
(defglobal ?*local* = 0)
(defglobal ?*var* = 0)

(defrule Presentazione
        (declare (salience 10000))
    
=>
        (printout t crlf crlf)
        (printout t "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" crlf)
		(printout t "||                                                                                           ||" crlf)
		(printout t "||                             ORIENTAMENTO UNIVERSITARIO                        	            ||" crlf)
		(printout t "||         Questo sistema esperto ti aiutera a scegliere l'Universita migliore per te        ||" crlf)
        (printout t "||                                                                                           ||" crlf)
		(printout t "||                                                                                           ||" crlf)
		(printout t "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" crlf)
		(printout t crlf crlf crlf)
        
)

(deffunction Domanda (?testo ?spiegazione ?spiegazione1 $?valori_ammessi)
		(bind ?flag_risposta FALSE)
	(while (eq ?flag_risposta FALSE) do
        (format t ?testo)
		(bind ?string "")
		(bind ?i 1)
		(while (<= ?i (length$ ?valori_ammessi))
			(bind ?string (str-cat ?string ?i "." (nth$ ?i ?valori_ammessi) " " ))
			(bind ?i (+ ?i 1))			
		)
		(if (neq ?spiegazione "") then
			(bind ?string (str-cat ?string "0.help "))		
		)
		
		(if (neq ?spiegazione1 "") then
			(bind ?string (str-cat ?string "-1.why"))		
		)
		
		(format t "(%s)?" ?string )
		(bind ?flag FALSE)
		(while (eq ?flag FALSE)do
			(bind ?risposta (read))
			(printout t crlf)
			(if (and(numberp ?risposta) (<= ?risposta (length$ ?valori_ammessi))) then 
					(bind ?flag TRUE) 
				else  
				(format t ?testo)
				(format t "(%s)?" ?string )
				
			)
		)
		(if (and(neq 0 ?risposta) (neq -1 ?risposta)) then
				(bind ?return (nth$ ?risposta ?valori_ammessi))
				(bind ?flag_risposta TRUE)			
		)
		
		(if (eq 0 ?risposta) then
		        (printout t crlf  )	
				(format t ?spiegazione)
				(printout t crlf crlf )	)
				
				(if (eq -1 ?risposta) then
		        (printout t crlf  )	
				(format t ?spiegazione1)
				(printout t crlf crlf )	)
	)
	?return	                                          
)


;;TEMPLATES

(deftemplate università
	(slot cf (type FLOAT )(default 0.9))
	(slot flag (default 0))
	(slot nome)
	(multislot regione)
	(multislot cdL)
	(multislot sedi)
	(slot scheda)
	(slot rettore)
    (slot tipo (type SYMBOL)(allowed-values pubblica privata telematica))
)  

(defrule uni-list 
(declare(salience 10000))
=>
(assert (università (tipo pubblica)(nome "Gabriele d'Annunzio")(regione abruzzo)(cdL medicina neuroscienze psicologia biotecnologia economia giurisprudenza architettura farmacia ingegneria-civile ingegneria-edile ingegneria-elettrica geologia lettere lingue filosofia) (sedi Chieti Pescara Vasto Lanciano "Torre de' Passeri" Torrevecchia) (scheda "https://www.unich.it/") (rettore "Sergio Caputi") ))
(assert (università (tipo pubblica)(nome "Università dell'Aquila")(regione abruzzo)(cdL ingegneria-civile ingegneria-edile ingegneria-ambientale informatica matematica ingegneria-industriale economia medicina biotecnologia chimica fisica scienze-umane) (sedi "L'Aquila" Avezzano Sulmona Roio) (scheda "http://www.univaq.it/") (rettore "Paola Inverardi") ))
(assert (università (tipo pubblica)(nome "Università di Teramo")(regione abruzzo)(cdL giurisprudenza scienze-politiche scienze-comunicazione biologia veterinaria) (sedi Teramo Atri Avezzano Giulianova Mosciano) (scheda "www.unite.it") (rettore "Luciano D'amico") ))

(assert (università (tipo pubblica)(nome "Università della Basilicata")(regione basilicata)(cdL scienze-umane farmacia architettura matematica economia) (sedi Matera Potenza) (scheda "http://portale.unibas.it/site/home.html") (rettore "Aurelia Sole") ))

(assert (università (tipo pubblica)(nome "Magna Grecia")(regione calabria)(cdL giurisprudenza economia sociologia ingegneria-informatica infermieristica logopedia ostetricia podologia psichiatria radiologia fisioterapia dietistica psicologia scienze-motorie fisiopatologia biotecnologia odontoiatria) (sedi Roccelletta Cosenza Crotone Lamezia "Reggio Calabria" "Vibo Valentia") (scheda "http://web.unicz.it/it/") (rettore "Giovambattista De Sarro")))
(assert (università (tipo pubblica)(nome "Università della Calabria")(regione calabria)(cdL biologia chimica farmacia fisica ingegneria-civile ingegneria-informatica ingegneria-elettronica ingegneria-meccanica ingegneria-gestionale lingue matematica informatica giurisprudenza economia scienze-politiche) (sedi Rende Crotone) (scheda "http://www.unical.it/portale/") (rettore "Gino Mirocle Crisci") ))
(assert (università (tipo pubblica)(nome "Mediterranea")(regione calabria)(cdL scienze-ambientali agraria scienze-alimentari architettura giurisprudenza economia ingegneria-civile ingegneria-industriale ingegneria-informatica) (sedi "Reggio Calabria" Lamezia) (scheda "http://www.unirc.it/") (rettore "Pasquale Catanoso") ))

(assert (università (tipo pubblica)(nome "Federico II ")(regione campania)(cdL farmacia medicina biotecnologia neuroscienze biomedica agraria veterinaria economia giurisprudenza scienze-sociali scienze-politiche architettura biologia fisica ingegneria-chimica ingegneria-civile ingegneria-elettrica ingegneria-industriale matematica chimica) (sedi Napoli Avellino Benevento Portici) (scheda "http://www.unina.it/home;jsessionid=4ECD8AB83E64A57F232FFBCAA97E2CB4.node_publisher11") (rettore "Gaetano Manfredi")))
(assert (università (tipo pubblica)(nome "L'Orientale")(regione campania)(cdL lingue archeologia scienze-politiche) (sedi Napoli) (scheda "http://www.unior.it/") (rettore "Elda Morlicchio") ))
(assert (università (tipo pubblica)(nome "Parthenope")(regione campania)(cdL giurisprudenza statistica economia ingegneria-civile ingegneria-informatica ingegneria-gestionale informatica biologia scienze-motorie scienze-nautiche) (sedi Napoli) (scheda "https://www.uniparthenope.it/") (rettore "Alberto Carotenuto") ))
(assert (università (tipo pubblica)(nome "Università Luigi Vanvitelli")(regione campania)(cdL architettura chirurgia economia giurisprudenza ingegneria-civile ingegneria-edile ingegneria-elettrica lettere matematica fisica medicina psicologia scienze-politiche odontoiatria) (sedi Aversa Capua Caserta "Santa Maria Capua Vetere" "Ariano Irpino" Avellino Grottaminarda Marcianise) (scheda "http://unicampania.it/") (rettore "Giuseppe Paolisso") ))
(assert (università (tipo pubblica)(nome "Università di Salerno")(regione campania)(cdL chirurgia medicina psichiatria pediatria endocrinologia farmacia archeologia) (sedi Fisciano Baronissi Salerno) (scheda "https://www.unisa.it/") (rettore "Aurelio Tommasetti") ))
(assert (università (tipo pubblica)(nome "Università del Sannio")(regione campania)(cdL ingegneria-civile ingegneria-elettrica ingegneria-informatica giurisprudenza economia statistica biotecnologia biologia geologia) (sedi Benevento "Ariano Irpino") (scheda "https://www.unisannio.it/it") (rettore "Filippo de Rossi") ))

(assert (università (tipo pubblica)(nome "Università di Bologna")(regione emilia)(cdL architettura beni-culturali chimica farmacia  filosofia fisica informatica ingegneria-civile ingegneria-chimica ingegneria-ambientale ingegneria-elettrica ingegneria-industriale lingue matematica medicina psicologia agraria biologia geologia scienze-formazione scienze-alimentari economia giurisprudenza chirurgia veterinaria scienze-politiche statistica) (sedi Bologna "Buenos Aires" Cesena Cesenatico Faenza Forli Imola Ozzano Ravenna Rimini) (scheda "https://www.unibo.it/it") (rettore "Francesco Ubertini") ))
(assert (università (tipo pubblica)(nome "Università di Ferrara")(regione emilia)(cdL economia chimica farmacia biotecnologia medicina ingegneria-civile ingegneria-edile ingegneria-elettrica fisica matematica informatica giurisprudenza lettere architettura) (sedi Ferrara Rovigo Bolzano "Pieve di Cento" Codigoro Rovereto) (scheda "http://www.unife.it/") (rettore "Giorgio Zauli") ))
(assert (università (tipo pubblica)(nome "Università di Modena")(regione emilia)(cdL economia giurisprudenza lingue chirurgia medicina odontoiatria geologia fisica informatica matematica ingegneria) (sedi Modena "Reggio Emilia" Mantova) (scheda "https://www.unimore.it/") (rettore "Angelo Oreste Andrisano") ))
(assert (università (tipo pubblica)(nome "Università di Parma")(regione emilia)(cdL lettere lingue giurisprudenza scienze-politiche ingegneria-civile ingegneria-edile ingegneria-elettrica architettura medicina chirurgia chimica economia matematica fisica informatica veterinaria) (sedi Parma Piacenza) (scheda "https://www.unipr.it/") (rettore "Paolo Andrei") ))

(assert (università (tipo pubblica)(nome "Università di Trieste")(regione friuli)(cdL medicina chirurgia fisica ingegneria-civile ingegneria-edile ingegneria-elettrica architettura matematica geologia chimica farmacia economia statistica giurisprudenza lingue scienze-politiche lettere ) (sedi Trieste Gorizia Pordenone Portogruaro) (scheda "https://www.units.it/") (rettore "	Maurizio Fermeglia") ))
(assert (università (tipo pubblica)(nome "Università di Udine")(regione friuli)(cdL lingue lettere scienze-alimentari scienze-ambientali economia statistica matematica informatica fisica medicina architettura ingegneria-civile ingegneria-edile ingegneria-elettrica giurisprudenza)	 (sedi Udine Gemona Gorizia Pordenone) (scheda "https://www.units.it/") (rettore "Alberto Felice De Toni") ))

(assert (università (tipo pubblica)(nome "Università di Cassino")(regione lazio)(cdL economia giurisprudenza ingegneria-civile ingegneria-ambientale ingegneria-industriale ingegneria-informatica lettere scienze-formazione scienze-motorie lingue) (sedi Cassino Frosinone Atina) (scheda "http://www.unicas.it/") (rettore "Giovanni Betta") ))
(assert (università (tipo pubblica)(nome "Università di Roma Foro Italico")(regione lazio)(cdL scienze-motorie) (sedi Roma) (scheda "http://www.uniroma4.it/") (rettore "Fabio Pigozzi") ))
(assert (università (tipo pubblica)(nome "La Sapienza")(regione lazio)(cdL architettura economia farmacia medicina giurisprudenza ingegneria-civile ingegneria-industriale ingegneria-informatica statistica lettere filosofia odontoiatria psicologia matematica fisica scienze-politiche sociologia ingegneria-aerospaziale) (sedi Civitavecchia Latina "Cisterna di Latina" Terracina Pomezia Rieti Bracciano "Buenos Aires" Malindi Ariccia Cassino Colleferro Frosinone Gaeta Guidonia Nettuno Pozzilli Isernia Viterbo Sora) (scheda "https://www.uniroma1.it/it/") (rettore "Eugenio Gaudio") ))
(assert (università (tipo pubblica)(nome "Tor Vergata")(regione lazio)(cdL ingegneria-suono economia giurisprudenza ingegneria-civile ingegneria-edile ingegneria-elettrica lettere filosofia medicina chirurgia matematica fisica geologia) (sedi Roma Sora Frascati Tivoli) (scheda "http://web.uniroma2.it/") (rettore "Giuseppe Novelli") ))
(assert (università (tipo pubblica)(nome "Roma Tre")(regione lazio)(cdL lettere filosofia lingue economia architettura giurisprudenza ingegneria-civile ingegneria-edile ingegneria-elettrica matematica fisica scienze-formazione scienze-politiche) (sedi Roma) (scheda "http://www.uniroma3.it/") (rettore "Luca Pietromarchi") ))
(assert (università (tipo pubblica)(nome "Università della Tuscia")(regione lazio)(cdL scienze-comunicazione lingue giurisprudenza beni-culturali economia ingegneria-industriale scienze-politiche agraria scienze-ambientali biologia biotecnologia scienze-alimentari) (sedi Viterbo Civitavecchia Rieti Tarquinia) (scheda "http://www.unitus.it/") (rettore "Alessandro Ruggieri") ))

(assert (università (tipo pubblica)(nome "Università di Genova")(regione liguria)(cdL matematica chimica fisica informatica farmacia medicina chirurgia economia giurisprudenza scienze-formazione scienze-politiche filosofia lingue lettere ingegneria-civile ingegneria-chimica ingegneria-ambientale ingegneria-meccanica ingegneria-gestionale ingegneria-elettrica ingegneria-elettronica architettura) (sedi Genova Chiavari Imperia "La Spezia" Livorno "Pietra Ligure" Savona) (scheda "https://unige.it/") (rettore "Paolo Comanducci") ))

(assert (università (tipo pubblica)(nome "Università di Bergamo")(regione lombardia)(cdL giurisprudenza ingegneria-gestionale ingegneria-industriale ingegneria-informatica lettere filosofia lingue economia scienze-umane) (sedi Bergamo Dalmine) (scheda "https://www.unibg.it/") (rettore "Remo Morzenti Pellegrini") ))
(assert (università (tipo pubblica)(nome "Università di Brescia")(regione lombardia)(cdL economia giurisprudenza architettura ingegneria-civile ingegneria-ambientale ingegneria-informatica ingegneria-meccanica ingegneria-industriale medicina chirurgia radiologia) (sedi Brescia Chiari Cremona "Desenzano del Garda" Esine Mantova) (scheda "https://www.unibs.it/") (rettore "Maurizio Tira") ))
(assert (università (tipo pubblica)(nome "Politecnico di Milano")(regione lombardia)(cdL ingegneria-musicale architettura ingegneria-costruzioni ingegneria-chimica chimica design ingegneria-elettronica fisica ingegneria-civile ingegneria-ambientale ingegneria-gestionale matematica ingegneria-meccanica ingegneria-aerospaziale) (sedi Milano Como Cremona Lecco Mantova Piacenza ) (scheda "https://www.polimi.it/") (rettore "Ferruccio Resta") ))
(assert (università (tipo pubblica)(nome "Università di Milano ")(regione lombardia)(cdL giurisprudenza medicina chirurgia lettere lingue scienze-politiche economia scienze-sociali veterinaria agraria scienze-motorie) (sedi Milano Bosisio Parini "Busto Arsizio" "Cernusco sul Naviglio" Crema Edolo "Garbagnate Milanese" Legnano Lodi Mantova Rozzano "San Donato Milanese" "Sesto San Giovanni") (scheda "http://www.unimi.it/") (rettore "Elio Franzini") ))
(assert (università (tipo pubblica)(nome "Università di Milano-Bicocca")(regione lombardia)(cdL economia statistica giurisprudenza medicina chirurgia psicologia biotecnologia biologia fisica informatica matematica scienze-formazione sociologia) (sedi ) (scheda "https://www.unimib.it/") (rettore "Cristina Messa") ))
(assert (università (tipo pubblica)(nome "Università degli Studi Superiori")(regione lombardia)(cdL scienze-umane scienze-sociali biotecnologia) (sedi Pavia) (scheda "http://www.iusspavia.it/home") (rettore "Michele di Francesco") ))
(assert (università (tipo pubblica)(nome "Università di Pavia")(regione lombardia)(cdL biologia chimica biotecnologia fisica giurisprudenza ingegneria-civile architettura ingegneria-industriale ingegneria-informatica matematica medicina musicologia beni-culturali chirurgia pediatria economia farmacia scienze-politiche lettere) (sedi Pavia Cremona Voghera Vigevano) (scheda "http://www.unipv.eu/site/home.html") (rettore "Fabio Rugge") ))
(assert (università (tipo pubblica)(nome "Università dell'Insurbia")(regione lombardia)(cdL chimica economia fisica informatica ingegneria-ambientale matematica scienze-motorie lingue biologia biotecnologia fisioterapia infermieristica ostetricia fisiopatologia radiologia giurisprudenza medicina odontoiatria) (sedi Como Varese "Busto Arsizio" Saronno) (scheda "https://www.uninsubria.it/") (rettore "Alberto Coen Porisini") ))

(assert (università (tipo pubblica)(nome "Università Politecnica delle Marche")(regione marche)(cdL ingegneria-civile ingegneria-edile architettura ingegneria-informatica ingegneria-industriale matematica economia medicina agraria scienze-alimentari scienze-ambientali biomedica odontoiatria scienze-sociali ingegneria-ambientale) (sedi  Ancona "Ascoli Piceno" Fermo Macerata "San Benedetto del Tronto" Pesaro) (scheda "https://www.univpm.it/Entra/") (rettore "Sauro Longhi") ))
(assert (università (tipo pubblica)(nome "Università di Camerino")(regione marche)(cdL architettura design biologia veterinaria giurisprudenza farmacia architettura) (sedi  Camerino "Ascoli Piceno" Matelica Recanati "San Benedetto del Tronto") (scheda "http://www.unicam.it/") (rettore "Claudio Pettinari") ))
(assert (università (tipo pubblica)(nome "Università di Macerata")(regione marche)(cdL economia giurisprudenza scienze-formazione beni-culturali scienze-politiche scienze-comunicazione lingue lettere filosofia) (sedi Macerata "Civitanova Marche" Fermo Jesi Osimo Spinetoli) (scheda "https://www.unimc.it/it") (rettore "Francesco Adornato") ))
(assert (università (tipo pubblica)(nome "Università di Urbino")(regione marche)(cdL giurisprudenza farmacia scienze-motorie biologia biotecnologia economia scienze-politiche scienze-sociali geologia scienze-ambientali scienze-comunicazione lingue scienze-formazione lettere filosofia ) (sedi Urbino Fano Pesaro) (scheda "https://www.uniurb.it/") (rettore "Vilberto Stocchi") ))

(assert (università (tipo pubblica)(nome "Università del Molise")(regione molise)(cdL agraria scienze-alimentari biologia economia giurisprudenza medicina lettere filosofia scienze-formazione) (sedi Campobasso Isernia Pesche Termoli) (scheda "https://www.unimol.it/") (rettore "Gianmaria Palmieri") ))

(assert (università (tipo pubblica)(nome "Università del Piemonte Orientale")(regione piemonte)(cdL medicina farmacia economia lettere filosofia giurisprudenza scienze-politiche scienze-sociali) (sedi Vercelli Alessandria Asti Biella Domodossola Novara Verbania) (scheda "https://www.uniupo.it/") (rettore "Cesare Emanuel") ))
(assert (università (tipo pubblica)(nome "Università di Torino")(regione piemonte)(cdL agraria medicina veterinaria economia giurisprudenza scienze-politiche lettere filosofia biotecnologia chimica statistica fisica informatica lingue matematica neuroscienze psicologia farmacia agraria chirurgia biologia pediatria biologia ) (sedi Torino Aosta Asti Biella Cuneo Savigliano Grugliasco) (scheda "https://www.unito.it/") (rettore "Gianmaria Ajani") ))
(assert (università (tipo pubblica)(nome "Politecnico di Torino")(regione piemonte)(cdL architettura design informatica ingegneria-elettronica ingegneria-ambientale ingegneria-gestionale ingegneria-meccanica ingegneria-aerospaziale ingegneria-edile matematica scienze-politiche) (sedi Torino Alessandria Aosta Biella Ivrea Mondovì Vercelli) (scheda "https://www.polito.it/") (rettore "Guido Saracco") ))

(assert (università (tipo pubblica)(nome "Politecnico di Bari")(regione puglia)(cdL ingegneria-civile ingegneria-ambientale ingegneria-edile ingegneria-chimica ingegneria-elettrica ingegneria-informatica ingegneria-meccanica matematica architettura fisica) (sedi Bari Foggia Taranto) (scheda "http://www.poliba.it/") (rettore "Eugenio Di Sciascio") ))
(assert (università (tipo pubblica)(nome "Università di Bari")(regione puglia)(cdL biologia biologia biotecnologia chimica economia farmacia fisica giurisprudenza informatica medicina lettere lingue veterinaria scienze-ambientali scienze-formazione psicologia scienze-comunicazione economia scienze-politiche lettere ) (sedi Bari Taranto Brindisi Acquaviva Tricase Lecce Valenzano) (scheda "https://www.uniba.it/") (rettore "Antonio Felice Uricchio") ))
(assert (università (tipo pubblica)(nome "Università di Foggia")(regione puglia)(cdL agraria economia giurisprudenza lettere beni-culturali scienze-formazione medicina chirurgia ) (sedi Foggia Barletta Cerignola Lucera Manfredonia "San Giovanni Rotondo" "San Severo" Matera Lagonegro) (scheda "https://www.unifg.it/") (rettore "Maurizio Ricci") ))
(assert (università (tipo pubblica)(nome "Università del Salento")(regione puglia)(cdL economia giurisprudenza ingegneria-civile ingegneria-edile ingegneria-elettrica lettere filosofia lingue beni-culturali matematica fisica scienze-formazione scienze-politiche scienze-sociali) (sedi Lecce Brindisi Mesagne) (scheda "https://www.unisalento.it/") (rettore "Vincenzo Zara") ))

(assert (università (tipo pubblica)(nome "Università di Cagliari")(regione sardegna)(cdL biologia farmacia ingegneria-civile ingegneria-edile ingegneria-elettrica architettura medicina chirurgia economia giurisprudenza scienze-politiche lettere filosofia ) (sedi Cagliari Nuoro Oristano Monserrato) (scheda "https://www.unica.it/unica/") (rettore "Maria Del Zompo") ))
(assert (università (tipo pubblica)(nome "Università di Sassari")(regione sardegna)(cdL agraria architettura design chimica farmacia giurisprudenza veterinaria biomedica economia medicina chirurgia lettere filosofia scienze-formazione) (sedi Sassari Alghero Nuoro Olbia Oristano "Tempio Pausania") (scheda "https://www.uniss.it/") (rettore "Massimo Carpinelli") ))

(assert (università (tipo pubblica)(nome "Università di Catania")(regione sicilia)(cdL agraria biologia geologia lettere filosofia scienze-formazione farmacia chimica fisica matematica informatica giurisprudenza architettura ingegneria-civile scienze-politiche economia biomedica biotecnologia chirurgia medicina) (sedi Catania Ragusa Siracusa) (scheda "http://www.unict.it/") (rettore "Francesco Basile") ))
(assert (università (tipo pubblica)(nome "Università di Messina")(regione sicilia)(cdL lettere filosofia economia giurisprudenza ingegneria-civile ingegneria-edile ingegneria-elettrica medicina biomedica odontoiatria chimica biologia farmacia scienze-ambientali psicologia pediatria matematica informatica scienze-politiche veterinaria) (sedi Messina Locri Modica Noto "Priolo Gargallo") (scheda "https://www.unime.it/it") (rettore "Salvatore Cuzzocrea") ))
(assert (università (tipo pubblica)(nome "Università di Palermo")(regione sicilia)(cdL architettura neuroscienze medicina biotecnologia chirurgia ingegneria-civile ingegneria-ambientale ingegneria-aerospaziale fisica chimica giurisprudenza ingegneria-chimica ingegneria-gestionale ingegneria-informatica ingegneria-meccanica matematica informatica agraria biologia farmacia economia statistica scienze-formazione scienze-politiche psicologia scienze-umane) (sedi Palermo Agrigento Caltanissetta Gela Enna Trapani) (scheda "http://www.unipa.it/") (rettore "Fabrizio Micari") ))

(assert (università (tipo pubblica)(nome "Università di Firenze")(regione toscana)(cdL chirurgia medicina neuroscienze psicologia biomedica biologia chimica fisica matematica informatica statistica economia giurisprudenza scienze-politiche scienze-sociali architettura agraria ingegneria-civile ingegneria-ambientale ingegneria-informatica lettere filosofia lingue scienze-formazione archeologia) (sedi Firenze Calenzano Empoli "Figline Valdarno" Pistoia Prato "San Giovanni Valdarno" "Sesto Fiorentino" Lagonegro) (scheda "https://www.unifi.it/") (rettore "Luigi Dei") ))
(assert (università (tipo pubblica)(nome "Scuola Normale Superiore")(regione toscana)(cdL scienze-umane matematica scienze-sociali) (sedi Pisa Firenze) (scheda "https://www.sns.it/") (rettore "Vincenzo Barone") ))
(assert (università (tipo pubblica)(nome "Scuola Superiore Sant'Anna")(regione toscana)(cdL economia giurisprudenza scienze-politiche agraria biotecnologia ingegneria-industriale ingegneria-informatica medicina) (sedi Pisa Pontedera) (scheda "https://www.santannapisa.it/it") (rettore "Pierdomenico Perata") ))
(assert (università (tipo pubblica)(nome "Università di Pisa")(regione toscana)(cdL biologia chimica economia farmacia filosofia fisica giurisprudenza informatica ingegneria-civile ingegneria-industriale ingegneria-informatica matematica medicina chirurgia agraria scienze-politiche veterinaria) (sedi Carrara Cecina Livorno Lucca Massa Pontedera "Rosignano Marittimo" Sarzana) (scheda "https://www.unipi.it/") (rettore "Paolo Maria Mancarella") ))
(assert (università (tipo pubblica)(nome "Università di Siena")(regione toscana)(cdL economia statistica giurisprudenza scienze-politiche filosofia scienze-formazione scienze-umane scienze-sociali scienze-politiche beni-culturali biotecnologia medicina chirurgia neuroscienze chimica farmacia ingegneria-informatica matematica fisica) (sedi Siena "Colle Val d'Elsa" Arezzo "San Giovanni Valdarno" Grosseto Follonica) (scheda "https://www.unisi.it/") (rettore "Francesco Frati") ))
(assert (università (tipo pubblica)(nome "Università per stranieri di Siena")(regione toscana)(cdL lingue scienze-umane) (sedi Siena) (scheda "https://www.unistrasi.it/") (rettore "Pietro Cataldi") ))

(assert (università (tipo pubblica)(nome "Università di Trento")(regione trentino)(cdL economia lettere filosofia giurisprudenza fisica ingegneria-ambientale ingegneria-meccanica ingegneria-industriale ingegneria-informatica matematica psicologia sociologia biologia agraria ) (sedi Trento Rovereto) (scheda "https://www.unitn.it/") (rettore "Paolo Collini") ))

(assert (università (tipo pubblica)(nome "Università di Perugia")(regione umbria)(cdL chimica biologia biotecnologia economia filosofia scienze-sociali scienze-umane scienze-formazione fisica geologia giurisprudenza ingegneria-civile ingegneria-ambientale lettere matematica informatica medicina veterinaria agraria scienze-alimentari chirurgia biomedica farmacia scienze-politiche) (sedi Perugia Orvieto Terni Foligno Assisi) (scheda "https://www.unipg.it/") (rettore "Franco Moriconi") ))
(assert (università (tipo pubblica)(nome "Università per stranieri di Perugia")(regione umbria)(cdL lingue  scienze-umane scienze-sociali) (sedi Perugia) (scheda "https://www.unistrapg.it/") (rettore "Giovanni Paciullo") ))

(assert (università (tipo pubblica)(nome "Università di Padova")(regione veneto)(cdL agraria beni-culturali archeologia biologia biomedica giurisprudenza filosofia sociologia psicologia fisica geologia ingegneria-civile ingegneria-edile ingegneria-ambientale ingegneria-informatica ingegneria-industriale matematica medicina veterinaria neuroscienze psicologia chimica farmacia economia scienze-politiche statistica ) (sedi Padova Asiago "Castelfranco Veneto" Chioggia Conegliano Feltre Mirano Legnaro Rovigo Treviso Venezia Vicenza "Vittorio Veneto" Portogruaro) (scheda "https://www.unipd.it/") (rettore "Rosario Rizzuto") ))
(assert (università (tipo pubblica)(nome "Università Ca'Foscari di Venezia")(regione veneto)(cdL economia filosofia beni-culturali scienze-ambientali informatica statistica lingue lettere filosofia) (sedi Venezia Treviso Portogruaro Mestre) (scheda "https://www.unive.it/") (rettore "Michele Bugliesi") ))
(assert (università (tipo pubblica)(nome "Università Iuav")(regione veneto)(cdL architettura ) (sedi Venezia Mestre Treviso) (scheda "http://www.iuav.it/homepage/") (rettore "Alberto Ferlenga") ))
(assert (università (tipo pubblica)(nome "Università di Verona")(regione veneto)(cdL biotecnologia economia scienze-umane informatica lingue giurisprudenza chirurgia odontoiatria medicina neuroscienze biomedica) (sedi Verona Ala Bolzano Mantova Rovereto Trento Vicenza Canazei) (scheda "http://www.univr.it/it") (rettore "Nicola Sartor") ))


(assert (università (tipo privata)(nome "Università della Valle d'Aosta")(regione valledaosta)(cdL lingue scienze-formazione psicologia) (sedi Aosta Saint-Christophe) (scheda "http://www.univda.it/") (rettore "Fabrizio Cassella") ))
(assert (università (tipo privata)(nome "Libera Università di Bolzano")(regione trentino)(cdL economia informatica design scienze-formazione  ) (sedi Bolzano Bressanone Brunico) (scheda "https://www.unibz.it/") (rettore "Paolo Lugli") ))
(assert (università (tipo privata)(nome "Università Kore di Enna")(regione sicilia )(cdL ingegneria-civile ingegneria-edile ingegneria-elettrica architettura economia giurisprudenza lettere filosofia lingue scienze-formazione) (sedi Enna) (scheda "https://www.unikore.it/") (rettore "Giovanni Puglisi") ))
(assert (università (tipo privata)(nome "Universita degli Studi di Scienze gastronomiche" )(regione  piemonte)(cdL scienze-gastronomiche) (sedi Bra ) (scheda "https://www.unisg.it/") (rettore "Andrea Pieroni") ))
(assert (università (tipo privata)(nome "Libera Università Mediterranea" )(regione puglia)(cdL economia giurisprudenza) (sedi Casamassima "Gioia del Colle" Trani) (scheda "http://www.lum.it/") (rettore "Emanuele Degennaro") ))
(assert (università (tipo privata)(nome "Università Carlo Cattaneo" )(regione  lombardia)(cdL economia ingegneria-gestionale) (sedi Castellanza) (scheda "http://www.liuc.it/") (rettore "Federico Visconti") ))
(assert (università (tipo privata)(nome "IULM" )(regione lombardia )(cdL interpretariato scienze-comunicazione turismo) (sedi Milano Roma) (scheda "http://www.iulm.it/") (rettore "Gianni Canova") ))
(assert (università (tipo privata)(nome "Università Cattolica del Sacro Cuore" )(regione lombardia )(cdL economia giurisprudenza lettere filosofia medicina chirurgia psicologia agraria lingue scienze-formazione matematica fisica scienze-politiche scienze-sociali) (sedi Milano Roma Piacenza Brescia Piacenza) (scheda "https://www.unicatt.it/") (rettore "Franco Anelli") ))
(assert (università (tipo privata)(nome "Università Luigi Bocconi" )(regione  lombardia)(cdL economia giurisprudenza scienze-sociali scienze-politiche) (sedi Milano ) (scheda "https://www.unibocconi.it/wps/wcm/connect/Bocconi/SitoPubblico_IT/Albero+di+navigazione/Home/") (rettore "Gianmario Verona") ))
(assert (università (tipo privata)(nome "Università San Raffaele" )(regione lombardia)(cdL medicina chirurgia psicologia filosofia) (sedi Segrate "Ponte San Pietro") (scheda "http://www.unisr.it/") (rettore "Alessandro Del Maschio") ))
(assert (università (tipo privata)(nome "Istituto Clicino Humanitas" )(regione  lombardia)(cdL biomedica medicina chirurgia) (sedi "Pieve Emanuele" Rozzano Bergamo) (scheda "https://www.hunimed.eu/it/") (rettore "Marco Montorsi") ))
(assert (università (tipo privata)(nome "Università Suor Orsola Benincasa" )(regione campania )(cdL scienze-formazione lettere giurisprudenza) (sedi Napoli Salerno) (scheda "https://www.unisob.na.it/") (rettore "Lucio d'Alessandro") ))
(assert (università (tipo privata)(nome "Libera Università Internazionale degli Studi Sociali Guido Carli" )(regione lazio )(cdL giurisprudenza economia scienze-politiche) (sedi Roma) (scheda "http://www.luiss.edu/") (rettore "Andrea Prencipe") ))
(assert (università (tipo privata)(nome "Libera Università Maria Santissima Assunta" )(regione  lazio sicilia puglia umbria)(cdL giurisprudenza economia scienze-politiche lingue scienze-umane) (sedi Roma Palermo Taranto Gubbio) (scheda "https://www.lumsa.it/") (rettore "Francesco Bonini") ))
(assert (università (tipo privata)(nome "Università Campus Bio-Medico" )(regione lazio )(cdL medicina chirurgia infermieristica scienze-alimentari ingegneria-industriale ingegneria-biomedica ingegneria-chimica ) (sedi Roma) (scheda "https://www.unicampus.it/") (rettore "Raffaele Calabrò") ))
(assert (università (tipo privata)(nome "Università degli Studi Internazionali di Roma" )(regione lazio )(cdL interpretariato scienze-politiche economia) (sedi Roma) (scheda "https://www.unint.eu/it/") (rettore "Francisco Matte Bon") ))
(assert (università (tipo privata)(nome "Link Campus University" )(regione  lazio campania)(cdL giurisprudenza economia scienze-comunicazione) (sedi Roma Pozzuoli) (scheda "https://www.unilink.it/") (rettore "Claudio Roveda") ))
(assert (università (tipo privata)(nome "Università Europea di Roma" )(regione lazio )(cdL economia giurisprudenza psicologia scienze-formazione turismo beni-culturali) (sedi Roma) (scheda "https://www.universitaeuropeadiroma.it/") (rettore "Pedro Barrajon") ))
(assert (università (tipo privata)(nome "Istituto d'arte applicata e design" )(regione piemonte )(cdL architettura design) (sedi Torino) (scheda "http://www.iaad.it/") (rettore "Laura Milani") ))
(assert (università (tipo privata)(nome "Istituto Universitario Salesiano Venezia" )(regione veneto )(cdL scienze-comunicazione psicologia pedagogia) (sedi Venezia Verona) (scheda "http://iusve.it/") (rettore "Roberto Dal Molin") ))


(assert (università (tipo telematica )(nome "Università Telematica Giustino Fortunato" )(regione campania lazio lombardia)(cdL giurisprudenza scienze-formazione psicologia) (sedi Benevento Roma Milano) (scheda "http://www.unifortunato.eu/") (rettore "Augusto Fantozzi") ))
(assert (università (tipo telematica )(nome "Università telematica Italian University Line" )(regione  toscana)(cdL scienze-formazione) (sedi Firenze) (scheda "http://www.iuline.it/") (rettore "Alessandro Mariani") ))
(assert (università (tipo telematica )(nome "Università telematica Pegaso" )(regione campania )(cdL giurisprudenza economia scienze-umane) (sedi Napoli) (scheda "https://www.unipegaso.it/website/") (rettore "Alessandro Bianchi") ))
(assert (università (tipo telematica )(nome "Università telematica e-Campus" )(regione  lombardia puglia campania sicilia abruzzo lazio piemonte veneto toscana sardegna calabria)(cdL ingegneria-civile ingegneria-edile ingegneria-elettrica lettere economia giurisprudenza psicologia ) (sedi Novedrate Bari Napoli Palermo Pescara Roma Torino Padova Firenze Cagliari Catania "Reggio Calabria") (scheda "http://www.uniecampus.it/") (rettore "Enzo Siviero") ))
(assert (università (tipo telematica )(nome "Università telematica Guglielmo Marconi" )(regione  lazio)(cdL economia giurisprudenza lettere scienze-formazione scienze-politiche fisica informatica  ) (sedi Roma) (scheda "https://www.unimarconi.it/") (rettore "Alessandra Brignati") ))
(assert (università (tipo telematica )(nome "Università degli Studi Niccolò Cusano" )(regione  lazio)(cdL economia giurisprudenza ingegneria-civile ingegneria-edile ingegneria-elettrica psicologia scienze-formazione scienze-politiche ) (sedi Roma) (scheda "https://www.unicusano.it/") (rettore "Fabio Fortuna ") ))
(assert (università (tipo telematica )(nome "Università telematica internazionale UniNettuno" )(regione  lazio)(cdL economia giurisprudenza ingegneria-civile ingegneria-edile ingegneria-elettrica beni-culturali psicologia scienze-formazione ) (sedi Roma) (scheda "https://www.uninettunouniversity.net/it/default.aspx") (rettore "Maria Amata Garito") ))
(assert (università (tipo telematica )(nome "Università telematica San Raffaele" )(regione  lazio)(cdL scienze-motorie agraria architettura design ) (sedi Roma) (scheda "http://www.unisanraffaele.gov.it/") (rettore "Enrico Garaci") ))
(assert (università (tipo telematica )(nome "Università telematica UNITELMA Sapienza" )(regione  lazio sicilia toscana veneto emilia puglia campania lombardia)(cdL economia giurisprudenza) (sedi Roma Gela Firenze Grosseto Mestre Modena Latina Lecce "Orta di Atella" Napoli Palermo "Sesto San Giovanni") (scheda "https://www.unitelmasapienza.it/it") (rettore "Francesco Avallone") ))
(assert (università (tipo telematica )(nome "Università telematica Universitas Mercatorum" )(regione lazio )(cdL economia turismo) (sedi Roma) (scheda "https://www.unimercatorum.it/") (rettore "Giovanni Cannata") ))
(assert (università (tipo telematica )(nome "Università telematica Leonardo da Vinci" )(regione  abruzzo)(cdL giurisprudenza psicologia scienze-formazione economia) (sedi "Torrevecchia Teatina") (scheda "http://www.unidav.it/") (rettore "Franco Cuccurullo") ))
)

(deftemplate domande
	(slot nome )
	(slot testo )
	(multislot valori)
	(slot id)
	(slot valore)
	
)

(deftemplate attributo
	(slot nome )
	(slot valore )
	(slot cf
		(type FLOAT) (default 0.0))
	(slot id (default 0))
)


;;FUNZIONI



(deffunction combina-cf (?cf1 ?cf2)
	(if (and(>= ?cf1 0)(>= ?cf2 0))then
		(bind ?ncf (-(+ ?cf1 ?cf2)(* ?cf1 ?cf2)))
	)
	(if (and(< ?cf1 0)(< ?cf2 0))then
		(bind ?ncf (+(+ ?cf1 ?cf2)(* ?cf1 ?cf2)))
	)
	(if (or (and (< ?cf1 0)(> ?cf2 0))(and (> ?cf1 0)(< ?cf2 0))(eq ?cf1 0.0)(eq ?cf2 0.0)) then		
		(bind ?ncf (/(+ ?cf1 ?cf2)(- 1 (min (abs ?cf1) (abs ?cf2)))))
	)
	?ncf
)

;combina se trova il valore nello slot
(deffunction combina (?cf2 ?tipo ?slot ?valore)
	(if (deftemplate-slot-multip ?tipo ?slot) then
		(delayed-do-for-all-facts((?m ?tipo))(member$ ?valore ?m:?slot) (modify ?m (cf (combina-cf ?m:cf ?cf2))))
		else 
		(delayed-do-for-all-facts((?m ?tipo))(eq ?m:?slot ?valore) (modify ?m (cf (combina-cf ?m:cf ?cf2))))	
	)
)


;;REGOLE
;******************TIPO UNIVERSITA 
(defrule tipoUni-Telematica
(declare (salience 100))
	(attributo (nome tipoUni)(valore Telematica))
=>
	;(combina +0.05 università tipo telematica)
	(combina -1.0 università tipo pubblica)
	(combina -1.0 università tipo privata)
)

(defrule tipoUni-Pubblica
(declare (salience 100))
	(attributo (nome tipoUni)(valore Pubblica))
=>
	;(combina +0.05 università tipo pubblica)
	(combina -1.0 università tipo telematica)
	(combina -1.0 università tipo privata)
)

(defrule tipoUni-Privata
(declare (salience 100))
	(attributo (nome tipoUni)(valore Privata))
=>
	;(combina +0.05 università tipo privata)
	(combina -1.0 università tipo pubblica)
	(combina -1.0 università tipo telematica)
)

(defrule JobSi 
(declare (salience 100))
	(attributo (nome Job)(valore Si))
=>
	(combina +0.01 università tipo privata)
	(combina +0.01 università tipo pubblica)
	(combina +0.05 università tipo telematica)
)

(defrule JobNo
(declare (salience 100))
	(attributo (nome Job)(valore No))
=>
	(combina +0.05 università tipo privata)
	(combina +0.05 università tipo pubblica)
	(combina +0.05 università tipo telematica)
)


(defrule JobSiSpostNo 
(declare (salience 100))
	(and(attributo (nome Job)(valore Si))(attributo (nome spostamento)(valore No)))
=>
	(combina +0.02 università tipo privata)
	(combina +0.02 università tipo pubblica)
	(combina +0.1 università tipo telematica)
)

(defrule JobNoSpostSi 
(declare (salience 100))
	(and(attributo (nome Job)(valore No))(attributo (nome spostamento)(valore Si)))
=>
	(combina +0.05 università tipo privata)
	(combina +0.05 università tipo pubblica)
)

;******************SPOSTAMENTO 
(defrule spostamento-si
(declare (salience 100))
	(attributo (nome spostamento)(valore Si))
=>
	;(combina +0.05 università tipo privata)
	;(combina +0.05 università tipo pubblica)
	(combina -0.3 università tipo telematica)
)



********SPOSTAMENTO NO + REGIONI
(defrule noAbruzzo
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore abruzzo)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noBasilicata
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore basilicata)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noCalabria
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore calabria)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)


(defrule noCampania
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore campania)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)


(defrule noEmilia
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore emilia)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noFriuli
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore friuli)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noLazio
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore lazio)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noLombardia
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore lombardia)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noLiguria
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore liguria)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noMarche
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore marche)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noMolise
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore molise)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noPiemonte
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore piemonte)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noPuglia
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore puglia)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noSardegna
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore sardegna)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noSicilia
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore sicilia)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noToscana
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore toscana)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noTrentino
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore trentino)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noUmbria
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore umbria)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione valledaosta)
	(combina -1.0 università regione veneto)
)

(defrule noValledaosta
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore valledaosta)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione veneto)
)

(defrule noVeneto
(declare (salience 100))
	(and(attributo (nome spostamento)(valore No)) (attributo(nome regione)(valore veneto)))
=>
	(assert (blocca regione))
	(combina -1.0 università regione abruzzo)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione emilia)
	(combina -1.0 università regione friuli)
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione lombardia)
	(combina -1.0 università regione liguria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione piemonte)
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione toscana)
	(combina -1.0 università regione trentino)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione valledaosta)
)

;*********NORD-CENTRO-SUD 
(defrule nordSi 
(declare (salience 100))
	(and (attributo (nome spostamento)(valore Si)) (attributo(nome nord) (valore Si)))
=>
	(combina +0.05 università regione emilia)
	(combina +0.05 università regione lombardia)
	(combina +0.05 università regione trentino)
	(combina +0.05 università regione valledaosta)
	(combina +0.05 università regione veneto)
	(combina +0.05 università regione liguria)
	(combina +0.05 università regione piemonte)
	(combina +0.05 università regione friuli)
	
)

(defrule nordNo 
(declare (salience 100))
	(and (attributo (nome spostamento)(valore Si)) (attributo(nome nord) (valore No)))
=>
	(combina  -1.0 università regione emilia)
	(combina  -1.0 università regione lombardia)
	(combina  -1.0 università regione trentino)
	(combina  -1.0 università regione valledaosta)
	(combina  -1.0 università regione veneto)
	(combina  -1.0 università regione liguria)
	(combina  -1.0 università regione piemonte)
	(combina  -1.0 università regione friuli)
	
)

(defrule centroSi 
(declare (salience 100))
	(and (attributo (nome spostamento)(valore Si)) (attributo(nome centro) (valore Si)))
=>
	(combina +0.05 università regione lazio)
	(combina +0.05 università regione umbria)
	(combina +0.05 università regione marche)
	(combina +0.05 università regione toscana)
)

(defrule centroNo
(declare (salience 100))
	(and (attributo (nome spostamento)(valore Si)) (attributo(nome centro) (valore No)))
=>
	(combina -1.0 università regione lazio)
	(combina -1.0 università regione umbria)
	(combina -1.0 università regione marche)
	(combina -1.0 università regione toscana)
)

(defrule sudSi
(declare (salience 100))
	(and (attributo (nome spostamento)(valore Si)) (attributo(nome sud) (valore Si)))
=>
	(combina +0.05 università regione puglia)
	(combina +0.05 università regione molise)
	(combina +0.05 università regione sicilia)
	(combina +0.05 università regione sardegna)
	(combina +0.05 università regione calabria)
	(combina +0.05 università regione campania)
	(combina +0.05 università regione basilicata)
	(combina +0.05 università regione abruzzo)
)

(defrule sudNo
(declare (salience 100))
	(and (attributo (nome spostamento)(valore Si)) (attributo(nome sud) (valore No)))
=>
	(combina -1.0 università regione puglia)
	(combina -1.0 università regione molise)
	(combina -1.0 università regione sicilia)
	(combina -1.0 università regione sardegna)
	(combina -1.0 università regione calabria)
	(combina -1.0 università regione campania)
	(combina -1.0 università regione basilicata)
	(combina -1.0 università regione abruzzo)
)


;*****************MATEMATICA-INFORMATICA-FISICA 

(defrule Mat 
	(declare (salience 100))
	(or(attributo (nome ScienzeMatInfFis) (valore Matematica)) (attributo(nome Mat)(valore Si)) )
=>
	(combina +0.05 università cdL matematica)
)

(defrule Inf  
	(declare (salience 100))
	(or(attributo (nome ScienzeMatInfFis) (valore Informatica)) (attributo(nome Inf)(valore Si)))
=>
	(combina +0.05 università cdL informatica)
)

(defrule Fis
	(declare (salience 100))
	(or(attributo (nome ScienzeMatInfFis) (valore Fisica)) (attributo(nome Fis)(valore Si)))
=>
	(combina +0.05 università cdL fisica)
)

;*************************CHIMICO BIOLOGICO 
(defrule Bio  
	(declare (salience 100))
	(or(attributo (nome Bio) (valore Si)) (attributo (nome ScienzeChimBio) (valore Biologia))) 
=>
	(combina +0.05 università cdL biologia)
)

(defrule Biotec
	(declare (salience 100))
	(or(attributo (nome Biotec) (valore Si))(attributo (nome ScienzeChimBio) (valore Biotecnologia)))
=>
	(combina +0.05 università cdL biotecnologia)
)

(defrule Geo
	(declare (salience 100))
	(or(attributo (nome Geo)(valore Si))(attributo (nome ScienzeChimBio) (valore Geologia)))
=>
	(combina +0.05 università cdL geologia)
)

(defrule SciAmb 
	(declare (salience 100))
	(or(attributo (nome SciAmb)(valore Si))(attributo (nome ScienzeChimBio) (valore "Scienze ambientali")))
=>
	(combina +0.05 università cdL scienze-ambientali)
)

(defrule Chim  
	(declare (salience 100))
	(or(attributo (nome Chim)(valore Si))(attributo (nome ScienzeChimBio) (valore Chimica)))
=>
	(combina +0.05 università cdL chimica)
)

(defrule Neur 
	(declare (salience 100))
	(or(attributo (nome Neur)(valore Si))(attributo (nome ScienzeChimBio) (valore Neuroscienze)))
=>
	(combina +0.05 università cdL  neuroscienze)
)

;************** MEDICHE 
(defrule Veterinaria  
	(declare (salience 100))
	(or(attributo (nome PersOAn)(valore Animali)) (attributo (nome ScienzeMed2)(valore Veterinaria)) (attributo (nome Vet)(valore Si))) 
=>
	(combina +0.05 università cdL veterinaria)
)

(defrule Generale 
	(declare (salience 100))
	(or(attributo (nome GenSpec)(valore Generale)))
=>
	(combina +0.05 università cdL medicina)
	(combina +0.05 università cdL chirurgia)
)

(defrule Medicina
	(declare (salience 100))
	(or(attributo (nome ScienzeMed3)(valore Medicina)) (attributo (nome ScienzeMed4)(valore Medicina)) )
=>
	(combina +0.05 università cdL medicina)
)

(defrule Chirurgia
	(declare (salience 100))
	(or(attributo (nome ScienzeMed3)(valore Chirurgia)) (attributo (nome ScienzeMed4)(valore Chirurgia)) )
=>
	(combina +0.05 università cdL chirurgia)
)


(defrule Farm 
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Farmacia))(attributo (nome Farm)(valore Si)) (attributo (nome ScienzeMed2)(valore Farmacia)) (attributo (nome ScienzeMed3)(valore Farmacia))(attributo (nome ScienzeMed4)(valore Farmacia)))
=>
	(combina +0.05 università cdL farmacia)
)


(defrule SciAl  
	(declare (salience 100))
	(or(attributo(nome BenSal2) (valore "Scienze Alimentari")) (attributo(nome SciAl) (valore Si)) ) 
=>
	(combina +0.05 università cdL scienze-alimentari)
)

(defrule Diet  
	(declare (salience 100))
	(or (attributo(nome BenSal2) (valore Dietistica)) (attributo(nome Diet) (valore Si)))
=>
	
	(combina +0.05 università cdL dietistica)
)

(defrule SciMot 
	(declare (salience 100))
	(or(attributo(nome BenSal2) (valore "Scienze Motorie"))(attributo(nome SciMot) (valore Si)))
=>
	(combina +0.05 università cdL scienze-motorie)
)

(defrule Fisio
	(declare (salience 100))
	(or(attributo(nome BenSal2 ) (valore Fisioterapia))(attributo(nome Fisio) (valore Si)))
=>
	(combina +0.05 università cdL fisioterapia)
)

(defrule Psich
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Psichiatria))(attributo (nome Psich)(valore Si))(attributo (nome ScienzeMed2)(valore Psichiatria))(attributo (nome ScienzeMed3)(valore Psichiatria))(attributo (nome ScienzeMed4)(valore Psichiatria)))
=>
	(combina +0.05 università cdL psichiatria)
)

(defrule Fisiopat
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Fisiopatologia))(attributo (nome Fisiopat)(valore Si))(attributo (nome ScienzeMed2)(valore Fisiopatologia))(attributo (nome ScienzeMed3)(valore Fisiopatologia))(attributo (nome ScienzeMed4)(valore Fisiopatologia)))
=>
	(combina +0.05 università cdL fisiopatologia)
)

(defrule Podologia
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Podologia))(attributo (nome Pod)(valore Si))(attributo (nome ScienzeMed2)(valore Podologia))(attributo (nome ScienzeMed3)(valore Podologia))(attributo (nome ScienzeMed4)(valore Podologia)))
=>
	(combina +0.05 università cdL podologia)
)

(defrule Radiologia
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Radiologia))(attributo (nome Rad)(valore Si))(attributo (nome ScienzeMed2)(valore Radiologia))(attributo (nome ScienzeMed3)(valore Radiologia))(attributo (nome ScienzeMed4)(valore Radiologia)))
=>
	(combina +0.05 università cdL radiologia)
)

(defrule Infermieristica 
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Infermieristica))(attributo (nome Inferm)(valore Si))(attributo (nome ScienzeMed2)(valore Infermieristica))(attributo (nome ScienzeMed3)(valore Infermieristica))(attributo (nome ScienzeMed4)(valore Infermieristica)))
=>
	(combina +0.05 università cdL infermieristica)
)

(defrule Ostetricia
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Ostetricia))(attributo (nome Ost)(valore Si))(attributo (nome ScienzeMed2)(valore Ostetricia))(attributo (nome ScienzeMed3)(valore Ostetricia))(attributo (nome ScienzeMed4)(valore Ostetricia)))
=>
	(combina +0.05 università cdL ostetricia)
)

(defrule Biomedicina
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Biomedicina))(attributo (nome Biom)(valore Si))(attributo (nome ScienzeMed2)(valore Biomedicina))(attributo (nome ScienzeMed3)(valore Biomedicina))(attributo (nome ScienzeMed4)(valore Biomedicina)))
=>
	(combina +0.05 università cdL biomedica)
)

(defrule Endocrinologia
	(declare (salience 100))
	(or(attributo (nome ScienzeMed)(valore Endocrinologia)) (attributo (nome End)(valore Si))(attributo (nome ScienzeMed2)(valore Endocrinologia))(attributo (nome ScienzeMed3)(valore Endocrinologia))(attributo (nome ScienzeMed4)(valore Endocrinologia)))
=>
	(combina +0.05 università cdL endocrinologia)
)

(defrule Odontoiatria
	(declare (salience 100))
	(or (attributo (nome ScienzeMed)(valore Odontoiatria)) (attributo (nome Odont)(valore Si))(attributo (nome ScienzeMed2)(valore Odontoiatria)) (attributo (nome ScienzeMed3)(valore Odontoiatria))(attributo (nome ScienzeMed4)(valore Odontoiatria)))
=>
	(combina +0.05 università cdL odontoiatria)
)

(defrule Logopedia
	(declare (salience 100))
	(or (attributo (nome ScienzeMed)(valore Logopedia)) (attributo (nome Logo)(valore Si))(attributo (nome ScienzeMed2)(valore Logopedia)) (attributo (nome ScienzeMed3)(valore Logopedia))(attributo (nome ScienzeMed4)(valore Logopedia)))
=>
	(combina +0.05 università cdL logopedia)
)
(defrule Pediatria 
	(declare (salience 100))
	(or (attributo (nome ScienzeMed)(valore Pediatria)) (attributo (nome Ped)(valore Si))(attributo (nome ScienzeMed2)(valore Pediatria)) (attributo (nome ScienzeMed3)(valore Pediatria))(attributo (nome ScienzeMed4)(valore Pediatria)))
=>
	(combina +0.05 università cdL pediatria)
)
;***********************INGEGNERISTICO

(defrule Architettura
	(declare (salience 100))
	(or(attributo (nome ScienzeIng) (valore Architettura)) (attributo(nome Arch)(valore Si)) )
=>
	(combina +0.05 università cdL architettura)
)

(defrule Design 
	(declare (salience 100))
	(or(attributo (nome ScienzeIng) (valore Design)) (attributo(nome Des )(valore Si)) )
=>
	(combina +0.05 università cdL design)
)

(defrule IngCivile  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Civile)) (attributo(nome IngCivile )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-civile)
)

(defrule IngEdile 
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Edile)) (attributo(nome IngEdile )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-edile)
)

(defrule IngAmbientale  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Ambientale)) (attributo(nome IngAmbient )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-ambientale)
)

(defrule IngIndustriale  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Industriale)) (attributo(nome IngInd )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-industriale)
)

(defrule IngInformatica  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Informatica)) (attributo(nome IngInf )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-informatica)
)

(defrule IngElettronica  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Elettronica)) (attributo(nome IngElettro )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-elettronica)
)

(defrule IngMeccanica  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Meccanica)) (attributo(nome IngMecc )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-meccanica)
)

(defrule IngGestionale  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Gestionale)) (attributo(nome IngGest )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-gestionale)
)

(defrule IngChimica  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Chimica)) (attributo(nome IngChimica )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-chimica)
)

(defrule IngElettrica   
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Elettrica)) (attributo(nome IngElettri )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-elettrica)
)

(defrule IngAerospaziale  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Aerospaziale)) (attributo(nome IngAerosp )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-aerospaziale)
)

(defrule IngCostruzioni  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Costruzioni)) (attributo(nome IngCostr )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-costruzioni)
)

(defrule IngBiomedica  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore Biomedica)) (attributo(nome IngBiomedica )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-biomedica)
)

(defrule IngSuono  
	(declare (salience 100))
	(or(attributo (nome qualeIng) (valore "Del suono")) (attributo(nome IngSuono )(valore Si)) )
=>
	(combina +0.05 università cdL ingegneria-suono)
)

;************************ECONOMICO STATISTICO

(defrule Economia 
	(declare (salience 100))
	(attributo (nome ScienzeEcoStat) (valore Economia)) 
=>
	(combina +0.05 università cdL economia)
)

(defrule Statistica
	(declare (salience 100))
	(attributo (nome ScienzeEcoStat) (valore Statistica)) 
=>
	(combina +0.05 università cdL statistica)
)

(defrule EconomiaStatistica 
	(declare (salience 100))
	(attributo (nome ScienzeEcoStat) (valore Entrambe))
=>
	(combina +0.05 università cdL statistica)
	(combina +0.05 università cdL economia)
)

;*****************************POLITICO SOCIALI 

(defrule ScienzePolitiche 
	(declare (salience 100))
	(or(attributo (nome ScienzePolSoc) (valore "Scienze Politiche")) (attributo (nome SciPol) (valore Si)) )
=>
	(combina +0.05 università cdL scienze-politiche)
)

(defrule ScienzeSociali  
	(declare (salience 100))
	(or(attributo (nome ScienzePolSoc) (valore "Scienze Sociali")) (attributo (nome SciSoc) (valore Si) ))
=>
	(combina +0.05 università cdL scienze-sociali)
)

(defrule Turismo  
	(declare (salience 100))
	(or(attributo (nome ScienzePolSoc) (valore Turismo)) (attributo (nome Tur) (valore Si) ))
=>
	(combina +0.05 università cdL turismo)
)

;******************************ANTICHITA

(defrule Lettere  
	(declare (salience 100))
	(or(attributo (nome ScienzeAnt) (valore Lettere)) (attributo (nome Lett) (valore Si) ))
=>
	(combina +0.05 università cdL lettere)
)

(defrule Archeologia
	(declare (salience 100))
	(or(attributo (nome ScienzeAnt) (valore Archeologia)) (attributo (nome Arche) (valore Si) ))
=>
	(combina +0.05 università cdL archeologia)
)

(defrule BeniCulturali  
	(declare (salience 100))
	(or(attributo (nome ScienzeAnt) (valore "Beni culturali")) (attributo (nome BenCult) (valore Si) ))
=>
	(combina +0.05 università cdL beni-culturali)
)

(defrule Musicologia  
	(declare (salience 100))
	(or(attributo (nome ScienzeAnt) (valore Musicologia)) (attributo (nome Music) (valore Si) ))
=>
	(combina +0.05 università cdL musicologia)
)

;***********************ScienzeStoriche

(defrule Psicologia 
	(declare (salience 100))
	(or(attributo (nome ScienzeStor) (valore Psicologia)) (attributo (nome Psic) (valore Si) ))
=>
	(combina +0.05 università cdL psicologia)
)

(defrule ScienzeUmane 
	(declare (salience 100))
	(or(attributo (nome ScienzeStor) (valore "Scienze Umane")) (attributo (nome SciUm) (valore Si) ))
=>
	(combina +0.05 università cdL scienze-umane)
)
(defrule ScienzeComunicazione
	(declare (salience 100))
	(or(attributo (nome ScienzeStor) (valore "Scienze della comunicazione")) (attributo (nome SciCom) (valore Si) ))
=>
	(combina +0.05 università cdL scienze-comunicazione)
)
(defrule Sociologia
	(declare (salience 100))
	(or(attributo (nome ScienzeStor) (valore Sociologia)) (attributo (nome Sociolog) (valore Si) ))
=>
	(combina +0.05 università cdL sociologia)
)

(defrule Filosofia
	(declare (salience 100))
	(or(attributo (nome ScienzeStor) (valore Filosofia)) (attributo (nome Filo) (valore Si) ))
=>
	(combina +0.05 università cdL filosofia)
)
(defrule Pedagogia
	(declare (salience 100))
	(or(attributo (nome ScienzeStor) (valore Pedagogia)) (attributo (nome Pedag) (valore Si) ))
=>
	(combina +0.05 università cdL pedagogia)
)

(defrule ScienzeFormazione
	(declare (salience 100))
	(or(attributo (nome ScienzeStor) (valore "Scienze della formazione")) (attributo (nome SciForm) (valore Si) ))
=>
	(combina +0.05 università cdL scienze-formazione)
)

;*****************LINGUISTICO

(defrule Lingue 
	(declare (salience 100))
	(attributo (nome ScienzeLing) (valore Lingue)) 
=>
	(combina +0.05 università cdL lingue)
)

(defrule Interpretariato
	(declare (salience 100))
	(attributo (nome ScienzeLing) (valore Interpretariato)) 
=>
	(combina +0.05 università cdL interpretariato)
)

(defrule LingueEInterpretariato
	(declare (salience 100))
	(attributo (nome ScienzeLing) (valore Entrambe)) 
=>
	(combina +0.05 università cdL interpretariato)
	(combina +0.05 università cdL lingue)
)


;************GIURIDICO
(defrule ScienzeGiuridiche
	(declare (salience 100)) 
	(attributo (nome Giur)(valore "Mi interessa"))
=>
	(combina +0.05 università cdL giurisprudenza)
)
















;;DOMANDE

(defrule ask-for-tipoUni
	(declare (salience 1000))
	(and(not(attributo(nome tipoUni))))
=>
	(bind ?risposta (Domanda "Che tipo di universita vuoi frequentare?" 
	"Te lo chiedo perchè le tipologie di Universita che ti ho presentato hanno delle caratteristiche differenti tra loro:
	PUBBLICA:Questo tipo di Universita e solitamente la meno costosa,di conseguenza c'e una piu alta possibilita di sovraffollamento di studenti al loro interno
	PRIVATA:Questo tipo di Universita e solitamente molto costosa, da tener presente pero e l'alta probabilita di inserimento del mondo del lavoro nei momenti immediatamente successivi al conseguimento della Laurea
	TELEMATICA:Questo tipo di Universita eroga corsi con modalita a distanza, fruibili tramite tecnologie di comunicazione, adatto a chi lavora o che magari non può spostarsi dalla propria città" 
	"Ti consigliero un'universita del tipo da te scelto" 
	Telematica Pubblica Privata "Non so"))
	(assert (attributo (nome tipoUni)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
    (assert (domande (nome tipoUni)(testo "Che universita vuoi frequentare?")(valori Telematica Pubblica Privata "Non so")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1)))

(defrule ask-for-spostamento
	(declare(salience 999))
	(and (not(attributo (nome tipoUni) (valore Telematica))) (or (attributo (nome tipoUni)(valore Privata)) (attributo (nome tipoUni) (valore Pubblica)) (attributo (nome tipoUni) (valore "Non so"))   )
	(not (attributo (nome spostamento))))
=>
	(bind ?risposta (Domanda "Sei disposto a trasferirti per studiare ?" 
	"Te lo chiedo per poter localizzare al meglio l'universita da consigliarti"
	"Ti consigliero' universita della tua regione o nelle zone d'italia da te indicate a seconda della tua risposta" 
	Si No))
	(assert	(attributo(nome spostamento)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome spostamento)(testo "Sei disposto a trasferirti per studiare?")(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1)))

(defrule ask-for-regione
	(declare (salience 998))
	(and (attributo (nome spostamento)(valore No)) 
	(not(attributo (nome regione))))
=>
	(bind ?risposta (Domanda "Di che regione sei?" 
	"Te lo chiedo per capire in che regione cercare l'universita migliore"
	"Ti consigliero' universita della tua regione" 
	abruzzo basilicata calabria campania emilia friuli lazio liguria lombardia marche molise piemonte puglia sardegna sicilia toscana trentino umbria valledaosta veneto))
	(assert	(attributo(nome regione)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome regione)(testo "In che regione vivi?")(valori abruzzo basilicata calabria campania emilia friuli lazio liguria lombardia marche molise piemonte puglia sardegna sicilia toscana trentino umbria valledaosta veneto)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Nord 
	(declare (salience 997))
	(and(attributo (nome spostamento)(valore Si)) 
	(not(attributo (nome nord))))
=>
	(bind ?risposta (Domanda "Ti trasferiresti al nord ?" 
	"Te lo chiedo per capire se vuoi studiare al nord"
	"Ti consigliero' un'universita nella zona d'Italia che preferisci" 
	Si No ))
	(assert	(attributo(nome nord)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome nord)(testo "Ti trasferiresti al nord ?" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Centro
	(declare (salience 996))
	(and (attributo (nome spostamento)(valore Si)) 
	(not(attributo (nome centro))))
=>
	(bind ?risposta (Domanda "Ti trasferiresti al centro?" 
	"Te lo chiedo per capire se vuoi studiare al centro"
	"Ti consigliero' un'universita nella zona d'Italia che preferisci" 
	Si No))
	(assert	(attributo(nome centro)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome centro)(testo "Ti trasferiresti al centro?" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Sud
	(declare (salience 995))
	(and(attributo (nome spostamento)(valore Si)) 
	(not(attributo (nome sud))))
=>
	(bind ?risposta (Domanda "Ti trasferiresti al sud?" 
	"Te lo chiedo per capire se vuoi studiare al sud"
	"Ti consigliero' un'universita nella zona d'Italia che preferisci" 
	Si No))
	(assert	(attributo(nome sud)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome sud)(testo "Ti trasferiresti al sud?")(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Job
	(declare (salience 993))
	(and(not(attributo (nome Job))))
=>
	(bind ?risposta (Domanda "Lavori o hai intenzione di lavorare?" 
	"Te lo chiedo perche se lavori e piu indicato frequentare un'Universita telematica"
	"Ti consigliero' la tipologia di universita piu adatta a te" 
	Si No "Non so"))
	(assert	(attributo(nome Job)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Job)(testo "Ti trasferiresti al sud?")(valori Si No "Non so")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)



(defrule ask-for-Scuola 
	(declare (salience 990))
	(not(attributo (nome scuola)))
=>
	(bind ?risposta (Domanda "Che scuola hai frequentato?" 
	"Te lo chiedo perche voglio capire che tipo di formazione scolastica hai avuto"
	"Ti consigliero' l'universita piu adatta alle tue competenze" 
	liceo tecnico professionale))
	(assert	(attributo(nome scuola)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome scuola)(testo "Che scuola hai frequentato?")(valori liceo tecnico professionale)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Liceo
	(declare (salience 985))
	(and (attributo (nome scuola) (valore liceo))
	(not(attributo (nome liceo))))
=>
	(bind ?risposta (Domanda "Che liceo hai frequentato?" 
	"Te lo chiedo perche voglio capire che tipo di formazione scolastica hai avuto"
	"Ti consigliero' l'universita piu adatta alle tue competenze" 
	scientifico classico artistico musicale linguistico scienzeUmane))
	(assert	(attributo(nome liceo)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome liceo)(testo "Che liceo hai frequentato?")(valori scientifico classico artistico musicale linguistico scienzeUmane)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Tecnico 
	(declare (salience 985))
	(and (attributo (nome scuola) (valore tecnico))
	(not(attributo (nome tecnico))))
=>
	(bind ?risposta (Domanda "Che istituto tecnico hai frequentato?" 
	"Te lo chiedo perche voglio capire che tipo di formazione scolastica hai avuto"
	"Ti consigliero' l'Universita piu adatta alle tue competenze" 
	agrario amministrazioneFinanzaMarketing chimico costruzioni elettronico grafico informatico moda meccanico turismo trasporti))
	(assert	(attributo(nome tecnico)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome tecnico)(testo "Che istituto tecnico hai frequentato?")(valori agrario amministrazioneFinanzaMarketing chimico costruzioni elettronico grafico informatico moda meccanico turismo trasporti)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)


(defrule ask-for-Professionale 
	(declare (salience 985))
	(and (attributo (nome scuola) (valore professionale))
	(not(attributo (nome professionale))))
=>
	(bind ?risposta (Domanda "Che istituto professionale hai frequentato?" 
	"Te lo chiedo perche voglio capire che tipo di formazione scolastica hai avuto"
	"Ti consigliero' l'Universita piu adatta alle tue competenze" 
	alberghiero industriale sanitario manutenzione))
	(assert	(attributo(nome professionale)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome professionale)(testo "Che istituto professionale hai frequentato?")(valori alberghiero industriale sanitario manutenzione)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-prosegui
	(declare (salience 980))
	(not(attributo (nome prosegui)))
=>
	(bind ?risposta (Domanda "Nel tuo percorso Universitario vorresti approfondire argomenti simili a quelli trattati alle superiori?" 
	"Te lo chiedo per capire se cio che hai studiato alle superiori ti ha appassionato o meno"
	"Ti consigliero' l'Universita piu adatta alle tue preferenze" 
	Si No Indifferente))
	(assert	(attributo(nome prosegui)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome prosegui)(testo "Vorresti studiare all'universita argomenti simili a quelli trattati alle superiori?")(valori Si No Indifferente)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Settore
	(declare (salience 975))
	(and (attributo (nome prosegui)(valore Indifferente))
	(not(attributo (nome settore))))
=>
	(bind ?risposta (Domanda "Quale settore ti interessa maggiormente?" 
	"Te lo chiedo per capire qual e il tuo macro-settore"
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	Scientifico Umanistico))
	(assert	(attributo(nome settore)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome settore)(testo "Quale settore ti interessa maggiormente?")(valori Scientifico Umanistico)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule Settori 
        (declare (salience 973))
=>
        (printout t crlf crlf)
		(printout t "IL CORSO DI LAUREA AL QUALE TI ISCRIVERAI RIENTRA IN UNO DEI SEGUENTI SETTORI" crlf)
		(printout t "Premi 0 per saperne di piu!" crlf)
		(printout t crlf crlf crlf)
)


(defrule ask-for-ScienzeMatematicheInformaticheFisiche
	(declare (salience 970))
	(and(or (attributo (nome settore)(valore Scientifico))
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore classico)))
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
 	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore sanitario)))
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome MatInfFis))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE MATEMATICO INFORMATICO E FISICO" 
	"In questo settore rientrano materie come Matematica e tutte le sue declinazioni, Informatica e Fisica, comprensiva delle sue applicazioni"
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome MatInfFis)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome MatInfFis)(testo "SETTORE MATEMATICO INFORMATICO E FISICO")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-MatInfFis 
	(declare (salience 969))
	(and (attributo (nome MatInfFis)(valore "Mi interessa")) 
	(not(attributo (nome ScienzeMatInfFis))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"MATEMATICA:Disciplina che studia i numeri, lo spazio, le strutture e i calcoli. Le sue aree di interesse principali sono aritmentica, algebra, geometria ed analisi
	INFORMATICA:Scienza applicata che si occupa del trattamento dell'informazione mediante procedure automatizzate, come tale è una disciplina fortemente connessa con l'automatica, l'elettronica ed anche l'elettromeccanica
	FISICA:Scienza della natura nel senso più ampio.Lo scopo della fisica è lo studio dei fenomeni naturali, ossia di tutti gli eventi che possano essere descritti, ovvero quantificati, attraverso grandezze fisiche opportune, al fine di stabilire principi e leggi che regolano le interazioni tra le grandezze stesse e rendano conto delle loro reciproche variazioni. "
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Matematica Informatica Fisica "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeMatInfFis)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeMatInfFis)(testo "Scegli la disciplina" )(valori Matematica Informatica Fisica "Più di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Mat 
	(declare (salience 969))
	(and (attributo (nome MatInfFis)(valore "Mi interessa")) (attributo(nome ScienzeMatInfFis)(valore "Piu di una tra queste"))
	(not(attributo (nome Mat))))
=>
	(bind ?risposta (Domanda "Matematica" 
	"MATEMATICA:Disciplina che studia i numeri, lo spazio, le strutture e i calcoli. Le sue aree di interesse principali sono aritmentica, algebra, geometria ed analisi"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Mat)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Mat)(testo "Matematica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Inf 
	(declare (salience 969))
	(and (attributo (nome MatInfFis)(valore "Mi interessa")) (attributo(nome ScienzeMatInfFis)(valore "Piu di una tra queste"))
	(not(attributo (nome Inf))))
=>
	(bind ?risposta (Domanda "Informatica" 
	"INFORMATICA:Scienza applicata che si occupa del trattamento dell'informazione mediante procedure automatizzate, come tale è una disciplina fortemente connessa con l'automatica, l'elettronica ed anche l'elettromeccanica"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Inf)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Inf)(testo "Informatica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Fis
	(declare (salience 969))
	(and (attributo (nome MatInfFis)(valore "Mi interessa")) (attributo(nome ScienzeMatInfFis)(valore "Piu di una tra queste"))
	(not(attributo (nome Fis))))
=>
	(bind ?risposta (Domanda "Fisica" 
	"FISICA:Scienza della natura nel senso più ampio.Lo scopo della fisica è lo studio dei fenomeni naturali, ossia di tutti gli eventi che possano essere descritti, ovvero quantificati, attraverso grandezze fisiche opportune, al fine di stabilire principi e leggi che regolano le interazioni tra le grandezze stesse e rendano conto delle loro reciproche variazioni."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Fis)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Fis)(testo "Fisica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)



(defrule ask-for-ScienzeChimicoBiologiche
	(declare (salience 965))
	(and(or (attributo (nome settore)(valore Scientifico))
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome ChimBio))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE CHIMICO E BIOLOGICO" 
	"Questo settore si basa sullo studio della Chimica, della Biologia e delle scienze della Terra"
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome ChimBio )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ChimBio)(testo "SETTORE CHIMICO E BIOLOGICO")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ChimBio
	(declare (salience 964))
	(and (attributo (nome ChimBio)(valore "Mi interessa")) 
	(not(attributo (nome ScienzeChimBio))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"BIOLOGIA:scienza che studia la vita, ovvero i processi fisici, chimici ed emergenti dei fenomeni che caratterizzano i sistemi viventi, inclusa la loro biochimica, meccanismi molecolari, genetica, anatomia, fisiologia e processi ermergenti come l'adattamento, lo sviluppo, l'evoluzione, l'interazione tra gli organismi ed il comportamento
	BIOTECNOLOGIA:La biotecnologia è l'applicazione tecnologica che si serve dei sistemi biologici, degli organismi viventi o di derivati di questi per produrre o modificare prodotti o processi per un fine specifico.
	GEOLOGIA:Branca delle scienze della Terra che studia la Terra e i processi che la plasmano e la cambiano
	SCIENZE AMBIENTALI:Le scienze ambientali includono problematiche quali il mutamento climatico, la conservazione, la biodiversità, l'inquinamento delle falde e del suolo, l'uso delle risorse naturali, la gestione dei rifiuti, lo sviluppo sostenibile, l'inquinamento dell'aria e l'inquinamento acustico.
	CHIMICA:Scienza che studia la composizione della materia ed il suo comportamento in base a tale composizione,definita come 'la scienza centrale' perché connette le altre scienze naturali, come l'astronomia, la fisica, le scienze dei materiali, la biologia e la geologia
	NEUROSCIENZE: L'insieme degli studi scientificamente condotti sul sistema nervoso"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Biologia Biotecnologia Geologia "Scienze ambientali" Chimica Neuroscienze "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeChimBio)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeChimBio)(testo "Scegli la disciplina" )(valori Biologia Biotecnologia Geologia "Scienze ambientali" Chimica Neuroscienze "Piu di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Bio 
	(declare (salience 963))
	(and (attributo (nome ChimBio)(valore "Mi interessa")) (attributo(nome ScienzeChimBio)(valore "Piu di una tra queste"))
	(not(attributo (nome Bio))))
=>
	(bind ?risposta (Domanda "Biologia" 
	"BIOLOGIA:scienza che studia la vita, ovvero i processi fisici, chimici ed emergenti dei fenomeni che caratterizzano i sistemi viventi, inclusa la loro biochimica, meccanismi molecolari, genetica, anatomia, fisiologia e processi ermergenti come l'adattamento, lo sviluppo, l'evoluzione, l'interazione tra gli organismi ed il comportamento"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Bio)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Bio)(testo "Biologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Biotec  
	(declare (salience 962))
	(and (attributo (nome ChimBio)(valore "Mi interessa")) (attributo(nome ScienzeChimBio)(valore "Piu di una tra queste"))
	(not(attributo (nome Biotec ))))
=>
	(bind ?risposta (Domanda "Biotecnologia" 
	"BIOTECNOLOGIA:La biotecnologia è l'applicazione tecnologica che si serve dei sistemi biologici, degli organismi viventi o di derivati di questi per produrre o modificare prodotti o processi per un fine specifico."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Biotec)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Biotec )(testo "Biotecnologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Geo 
	(declare (salience 961))
	(and (attributo (nome ChimBio)(valore "Mi interessa")) (attributo(nome ScienzeChimBio)(valore "Piu di una tra queste"))
	(not(attributo (nome Geo))))
=>
	(bind ?risposta (Domanda "Geologia" 
	"GEOLOGIA:Branca delle scienze della Terra che studia la Terra e i processi che la plasmano e la cambiano"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Geo)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Geo)(testo "Geologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-SciAmb 
	(declare (salience 960))
	(and (attributo (nome ChimBio)(valore "Mi interessa")) (attributo(nome ScienzeChimBio)(valore "Piu di una tra queste"))
	(not(attributo (nome SciAmb))))
=>
	(bind ?risposta (Domanda "Scienze Ambientali " 
	"SCIENZE AMBIENTALI:Le scienze ambientali includono problematiche quali il mutamento climatico, la conservazione, la biodiversità, l'inquinamento delle falde e del suolo, l'uso delle risorse naturali, la gestione dei rifiuti, lo sviluppo sostenibile, l'inquinamento dell'aria e l'inquinamento acustico."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciAmb)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciAmb)(testo "Scienze Ambientali" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Chim 
	(declare (salience 959))
	(and (attributo (nome ChimBio)(valore "Mi interessa")) (attributo(nome ScienzeChimBio)(valore "Piu di una tra queste"))
	(not(attributo (nome Chim))))
=>
	(bind ?risposta (Domanda "Chimica" 
	"CHIMICA:Scienza che studia la composizione della materia ed il suo comportamento in base a tale composizione,definita come 'la scienza centrale' perché connette le altre scienze naturali, come l'astronomia, la fisica, le scienze dei materiali, la biologia e la geologia"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Chim)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Chim)(testo "Chimica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Neur 
	(declare (salience 958))
	(and (attributo (nome ChimBio)(valore "Mi interessa")) (attributo(nome ScienzeChimBio)(valore "Piu di una tra queste"))
	(not(attributo (nome Neur))))
=>
	(bind ?risposta (Domanda "Neuroscienze" 
	"NEUROSCIENZE: L'insieme degli studi scientificamente condotti sul sistema nervoso"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Neur)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Neur)(testo "Neuroscienze" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)


(defrule ask-for-ScienzeMediche
	(declare (salience 955))
	(and(or (attributo (nome settore)(valore Scientifico))
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome Med ))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE MEDICO " 
	"TODO In questo settore si studia"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome Med  )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Med )(testo "SETTORE MEDICO")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-PersAn      
	(declare (salience 954))
	(and (attributo (nome Med)(valore "Mi interessa"))
	(not(attributo (nome PersOAn))))
=>
	(bind ?risposta (Domanda "Preferisci l'applicazione della medicina a..." 
	"Te lo chiedo per capire che tipo di essere(umano o animale) ti interessa maggiormente esaminare dal punto di vista medico"
	"Ti consigliero' un'Universita in cui si studi la Medicina applicata all'uomo, agli animali o ad entrambi" 
	Persone Animali Indifferente))
	(assert	(attributo(nome PersOAn)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome PersOAn)(testo "Preferesti applicare la medicina a" )(valori  Persone Animali Indifferente )(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-GenSpec    
	(declare (salience 953))
	(and (and(attributo (nome Med)(valore "Mi interessa")) (or (attributo (nome PersOAn)(valore Persone)) (attributo (nome PersOAn)(valore Indifferente))))
	(not(attributo (nome GenSpec))))
=>
	(bind ?risposta (Domanda "Preferisci un approccio al campo medico generale o piu specifico?" 
	"Te lo chiedo per capire se sei interessato ad avere una conoscenza della Medicina piu ampia e generica o specifica"
	"Ti consigliero' un'Universita in cui si studi Medicina con l'approccio da te preferito " 
	Generale Specifico "Non so"))
	(assert	(attributo(nome GenSpec)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome GenSpec)(testo "Generale o specifico?" )(valori  Generale Specifico "Non so")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Med    
	(declare (salience 952))
	(and(attributo (nome GenSpec)(valore Specifico)) (attributo (nome PersOAn)(valore Persone))
	(not(attributo (nome ScienzeMed))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"FARMACIA:Scienza studiata (principi teorici) e la tecnica (procedimenti pratici) della preparazione e distribuzione dei prodotti farmaceutici
	BENESSERE E SALUTE:Settore che comprende lo studio di Scienze alimentari,motorie e di prevenzione e cura di pazienti affetti da patologie fisiche
	PSICHIATRIA:Branca specialistica della medicina che si occupa dello studio sperimentale, della prevenzione, della cura e della riabilitazione dei disturbi mentali
	FISIOPATOLOGIA:Branca della medicina che si occupa dello studio, della cura e della prevenzione delle malattie.
	PODOLOGIA:Disciplina paramedica che tratta alcune affezioni minori del piede con metodi incruenti, ortesici e idro-massoterapici e svolge, su prescrizione medica, attività di prevenzione e di medicazione del piede stesso
	RADIOLOGIA:Branca della medicina che si occupa della produzione e dell'interpretazione a fini diagnostici o terapeutici di immagini radiologiche. È detta anche radiologia diagnostica o radiodiagnostica.
	ODONTOIATRIA:Branca della medicina che si occupa della prevenzione, della diagnosi e della terapia medica e chirurgica delle patologie che colpiscono denti, gengive, ossa mascellari (mascellare superiore e inferiore o mandibola), articolazioni temporo-mandibolari (ATM), ghiandole salivari, tessuti neuro-muscolari e mucose orali.
	INFERMIERISTICA:Attività relativa all'assistenza terapeutica, palliativa, riabilitativa, educativa e preventiva rivolta all'individuo, alla comunità o alla popolazione, sia che essa sia svolta su soggetti sani o malati, al fine di recuperare, uno stato di salute ottimale e migliorare sempre più il proprio stato di salute o del prevenire l'insorgenza di alterazioni morfo-funzionali dell'individuo o della comunità.
	OSTETRICIA:Ramo delle professioni sanitarie che si occupa dell'assistenza alla donna durante la gravidanza, il parto ed il puerperio. Essa studia le normali modificazioni che avvengono all'interno del corpo femminile durante i nove mesi della gravidanza, durante le fasi del parto e durante il puerperio, l'immediato periodo dopo il parto. Si occupa inoltre di tutte le condizioni patologiche che possono insorgere a carico della madre e del sistema feto-placentare.
	BIOMEDICINA:Branca della scienza medica che applica principi della biologia e delle scienze naturali alla pratica clinica,comporta lo studio dei processi patofisiologici con metodi propri di biologia, chimica e fisica
	ENDOCRINOLOGIA:branca della medicina interna che studia il sistema endocrino con particolare attenzione verso le patologie delle ghiandole a secrezione interna, ossia quelle il cui prodotto viene direttamente immesso nel sangue. Tali prodotti prendono il nome di ormoni
	LOGOPEDIA:disciplina sanitaria che si occupa dello studio, della prevenzione, della valutazione e della cura delle patologie e dei disturbi della voce, del linguaggio, della comunicazione, della deglutizione e dei disturbi cognitivi connessi
	PEDIATRIA:branca della medicina che si occupa dello sviluppo psicofisico dei bambini e della diagnosi e terapia delle malattie infantili"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Logopedia Pediatria "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeMed)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeMed)(testo "Scegli tra queste discipline" )(valori  Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Logopedia Pediatria "Piu di una tra queste" )(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Med2  
	(declare (salience 952))
	(and(attributo (nome GenSpec)(valore Specifico)) (attributo (nome PersOAn)(valore Indifferente))
	(not(attributo (nome ScienzeMed2))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"FARMACIA:Scienza studiata (principi teorici) e la tecnica (procedimenti pratici) della preparazione e distribuzione dei prodotti farmaceutici
	BENESSERE E SALUTE:Settore che comprende lo studio di Scienze alimentari,motorie e di prevenzione e cura di pazienti affetti da patologie fisiche
	PSICHIATRIA:Branca specialistica della medicina che si occupa dello studio sperimentale, della prevenzione, della cura e della riabilitazione dei disturbi mentali
	FISIOPATOLOGIA:Branca della medicina che si occupa dello studio, della cura e della prevenzione delle malattie.
	PODOLOGIA:Disciplina paramedica che tratta alcune affezioni minori del piede con metodi incruenti, ortesici e idro-massoterapici e svolge, su prescrizione medica, attività di prevenzione e di medicazione del piede stesso
	RADIOLOGIA:Branca della medicina che si occupa della produzione e dell'interpretazione a fini diagnostici o terapeutici di immagini radiologiche. È detta anche radiologia diagnostica o radiodiagnostica.
	ODONTOIATRIA:Branca della medicina che si occupa della prevenzione, della diagnosi e della terapia medica e chirurgica delle patologie che colpiscono denti, gengive, ossa mascellari (mascellare superiore e inferiore o mandibola), articolazioni temporo-mandibolari (ATM), ghiandole salivari, tessuti neuro-muscolari e mucose orali.
	INFERMIERISTICA:Attività relativa all'assistenza terapeutica, palliativa, riabilitativa, educativa e preventiva rivolta all'individuo, alla comunità o alla popolazione, sia che essa sia svolta su soggetti sani o malati, al fine di recuperare, uno stato di salute ottimale e migliorare sempre più il proprio stato di salute o del prevenire l'insorgenza di alterazioni morfo-funzionali dell'individuo o della comunità.
	OSTETRICIA:Ramo delle professioni sanitarie che si occupa dell'assistenza alla donna durante la gravidanza, il parto ed il puerperio. Essa studia le normali modificazioni che avvengono all'interno del corpo femminile durante i nove mesi della gravidanza, durante le fasi del parto e durante il puerperio, l'immediato periodo dopo il parto. Si occupa inoltre di tutte le condizioni patologiche che possono insorgere a carico della madre e del sistema feto-placentare.
	BIOMEDICINA:Branca della scienza medica che applica principi della biologia e delle scienze naturali alla pratica clinica,comporta lo studio dei processi patofisiologici con metodi propri di biologia, chimica e fisica
	ENDOCRINOLOGIA:branca della medicina interna che studia il sistema endocrino con particolare attenzione verso le patologie delle ghiandole a secrezione interna, ossia quelle il cui prodotto viene direttamente immesso nel sangue. Tali prodotti prendono il nome di ormoni
	VETERINARIA:branca delle scienze mediche che si occupa della salute e del benessere degli animali, del loro allevamento e dei prodotti che ne derivano, siano essi materiali che immateriali
	LOGOPEDIA:disciplina sanitaria che si occupa dello studio, della prevenzione, della valutazione e della cura delle patologie e dei disturbi della voce, del linguaggio, della comunicazione, della deglutizione e dei disturbi cognitivi connessi
	PEDIATRIA:branca della medicina che si occupa dello sviluppo psicofisico dei bambini e della diagnosi e terapia delle malattie infantili"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Veterinaria Logopedia Pediatria "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeMed2)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeMed2)(testo "Scegli tra queste discipline" )(valori  Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Veterinaria Logopedia Pediatria "Piu di una tra queste" )(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Med3 
	(declare (salience 952))
	(and(attributo (nome GenSpec)(valore Indifferente)) (attributo (nome PersOAn)(valore Persone))
	(not(attributo (nome ScienzeMed3))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"MEDICINA: scienza che studia il corpo umano al fine di garantire la salute delle persone, in particolare riguardo alla definizione, prevenzione e cura delle malattie, oltre alle diverse modalità di alleviare le sofferenze dei malati
	CHIRURGIA:scienza che si occupa di studiare quelle malattie che potendo essere curate con le proprie mani vengono appunto dette chirurgiche.
	FARMACIA:Scienza studiata (principi teorici) e la tecnica (procedimenti pratici) della preparazione e distribuzione dei prodotti farmaceutici
	BENESSERE E SALUTE:Settore che comprende lo studio di Scienze alimentari,motorie e di prevenzione e cura di pazienti affetti da patologie fisiche
	PSICHIATRIA:Branca specialistica della medicina che si occupa dello studio sperimentale, della prevenzione, della cura e della riabilitazione dei disturbi mentali
	FISIOPATOLOGIA:Branca della medicina che si occupa dello studio, della cura e della prevenzione delle malattie.
	PODOLOGIA:Disciplina paramedica che tratta alcune affezioni minori del piede con metodi incruenti, ortesici e idro-massoterapici e svolge, su prescrizione medica, attività di prevenzione e di medicazione del piede stesso
	RADIOLOGIA:Branca della medicina che si occupa della produzione e dell'interpretazione a fini diagnostici o terapeutici di immagini radiologiche. È detta anche radiologia diagnostica o radiodiagnostica.
	ODONTOIATRIA:Branca della medicina che si occupa della prevenzione, della diagnosi e della terapia medica e chirurgica delle patologie che colpiscono denti, gengive, ossa mascellari (mascellare superiore e inferiore o mandibola), articolazioni temporo-mandibolari (ATM), ghiandole salivari, tessuti neuro-muscolari e mucose orali.
	INFERMIERISTICA:Attività relativa all'assistenza terapeutica, palliativa, riabilitativa, educativa e preventiva rivolta all'individuo, alla comunità o alla popolazione, sia che essa sia svolta su soggetti sani o malati, al fine di recuperare, uno stato di salute ottimale e migliorare sempre più il proprio stato di salute o del prevenire l'insorgenza di alterazioni morfo-funzionali dell'individuo o della comunità.
	OSTETRICIA:Ramo delle professioni sanitarie che si occupa dell'assistenza alla donna durante la gravidanza, il parto ed il puerperio. Essa studia le normali modificazioni che avvengono all'interno del corpo femminile durante i nove mesi della gravidanza, durante le fasi del parto e durante il puerperio, l'immediato periodo dopo il parto. Si occupa inoltre di tutte le condizioni patologiche che possono insorgere a carico della madre e del sistema feto-placentare.
	BIOMEDICINA:Branca della scienza medica che applica principi della biologia e delle scienze naturali alla pratica clinica,comporta lo studio dei processi patofisiologici con metodi propri di biologia, chimica e fisica
	ENDOCRINOLOGIA:branca della medicina interna che studia il sistema endocrino con particolare attenzione verso le patologie delle ghiandole a secrezione interna, ossia quelle il cui prodotto viene direttamente immesso nel sangue. Tali prodotti prendono il nome di ormoni
	LOGOPEDIA:disciplina sanitaria che si occupa dello studio, della prevenzione, della valutazione e della cura delle patologie e dei disturbi della voce, del linguaggio, della comunicazione, della deglutizione e dei disturbi cognitivi connessi
	PEDIATRIA:branca della medicina che si occupa dello sviluppo psicofisico dei bambini e della diagnosi e terapia delle malattie infantili"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Medicina Chirurgia Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Logopedia Pediatria "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeMed3)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeMed3)(testo "Scegli tra queste discipline" )(valori Medicina Chirurgia Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Logopedia Pediatria "Piu di una tra queste" )(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Med4 
	(declare (salience 952))
	(and(attributo (nome GenSpec)(valore Indifferente)) (attributo (nome PersOAn)(valore Indifferente))
	(not(attributo (nome ScienzeMed4))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"MEDICINA: scienza che studia il corpo umano al fine di garantire la salute delle persone, in particolare riguardo alla definizione, prevenzione e cura delle malattie, oltre alle diverse modalità di alleviare le sofferenze dei malati
	CHIRURGIA:scienza che si occupa di studiare quelle malattie che potendo essere curate con le proprie mani vengono appunto dette chirurgiche.
	FARMACIA:Scienza studiata (principi teorici) e la tecnica (procedimenti pratici) della preparazione e distribuzione dei prodotti farmaceutici
	BENESSERE E SALUTE:Settore che comprende lo studio di Scienze alimentari,motorie e di prevenzione e cura di pazienti affetti da patologie fisiche
	PSICHIATRIA:Branca specialistica della medicina che si occupa dello studio sperimentale, della prevenzione, della cura e della riabilitazione dei disturbi mentali
	FISIOPATOLOGIA:Branca della medicina che si occupa dello studio, della cura e della prevenzione delle malattie.
	PODOLOGIA:Disciplina paramedica che tratta alcune affezioni minori del piede con metodi incruenti, ortesici e idro-massoterapici e svolge, su prescrizione medica, attività di prevenzione e di medicazione del piede stesso
	RADIOLOGIA:Branca della medicina che si occupa della produzione e dell'interpretazione a fini diagnostici o terapeutici di immagini radiologiche. È detta anche radiologia diagnostica o radiodiagnostica.
	ODONTOIATRIA:Branca della medicina che si occupa della prevenzione, della diagnosi e della terapia medica e chirurgica delle patologie che colpiscono denti, gengive, ossa mascellari (mascellare superiore e inferiore o mandibola), articolazioni temporo-mandibolari (ATM), ghiandole salivari, tessuti neuro-muscolari e mucose orali.
	INFERMIERISTICA:Attività relativa all'assistenza terapeutica, palliativa, riabilitativa, educativa e preventiva rivolta all'individuo, alla comunità o alla popolazione, sia che essa sia svolta su soggetti sani o malati, al fine di recuperare, uno stato di salute ottimale e migliorare sempre più il proprio stato di salute o del prevenire l'insorgenza di alterazioni morfo-funzionali dell'individuo o della comunità.
	OSTETRICIA:Ramo delle professioni sanitarie che si occupa dell'assistenza alla donna durante la gravidanza, il parto ed il puerperio. Essa studia le normali modificazioni che avvengono all'interno del corpo femminile durante i nove mesi della gravidanza, durante le fasi del parto e durante il puerperio, l'immediato periodo dopo il parto. Si occupa inoltre di tutte le condizioni patologiche che possono insorgere a carico della madre e del sistema feto-placentare.
	BIOMEDICINA:Branca della scienza medica che applica principi della biologia e delle scienze naturali alla pratica clinica,comporta lo studio dei processi patofisiologici con metodi propri di biologia, chimica e fisica
	ENDOCRINOLOGIA:branca della medicina interna che studia il sistema endocrino con particolare attenzione verso le patologie delle ghiandole a secrezione interna, ossia quelle il cui prodotto viene direttamente immesso nel sangue. Tali prodotti prendono il nome di ormoni
	VETERINARIA:branca delle scienze mediche che si occupa della salute e del benessere degli animali, del loro allevamento e dei prodotti che ne derivano, siano essi materiali che immateriali
	LOGOPEDIA:disciplina sanitaria che si occupa dello studio, della prevenzione, della valutazione e della cura delle patologie e dei disturbi della voce, del linguaggio, della comunicazione, della deglutizione e dei disturbi cognitivi connessi
	PEDIATRIA:branca della medicina che si occupa dello sviluppo psicofisico dei bambini e della diagnosi e terapia delle malattie infantili"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Medicina Chirurgia Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Veterinaria Logopedia Pediatria "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeMed4)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeMed4)(testo "Scegli tra queste discipline" )(valori  Medicina Chirurgia Farmacia "Benessere e salute" Psichiatria Fisiopatologia Podologia Radiologia Odontoiatria infermieristica Ostetricia Biomedicina Endocrinologia Veterinaria Logopedia Pediatria "Piu di una tra queste" )(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)


(defrule ask-for-Farm 
	(declare (salience 951))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste")) (attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Farm))))
=>
	(bind ?risposta (Domanda "Farmacia" 
	"FARMACIA:Scienza studiata (principi teorici) e la tecnica (procedimenti pratici) della preparazione e distribuzione dei prodotti farmaceutici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Farm)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Farm)(testo "Farmacia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)
(defrule ask-for-BenSal 
	(declare (salience 950))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste")) (attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome BenSal))))
=>
	(bind ?risposta (Domanda "Benessere e salute" 
	"BENESSERE E SALUTE:Settore che comprende lo studio di Scienze alimentari,motorie e di prevenzione e cura di pazienti affetti da patologie fisiche"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome BenSal)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome BenSal)(testo "Benessere e salute" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-BenSal2
	(declare (salience 950))
	(and (or(attributo (nome BenSal)(valore Si)) (attributo (nome ScienzeMed)(valore "Benessere e salute")) (attributo (nome ScienzeMed2)(valore "Benessere e salute")) (attributo (nome ScienzeMed3)(valore "Benessere e salute")) (attributo (nome ScienzeMed4)(valore "Benessere e salute")))  
	(not(attributo (nome BenSal2))))
=>
	(bind ?risposta (Domanda "Scegli tra queste sotto-discipline" 
	"SCIENZE ALIMENTARI:Studio relativo a tutti gli aspetti tecnici degli alimenti, cominciando dalla raccolta e dalla macellazione, per finire con la cottura ed il consumo.
	DIETISTICA:Applicazione della scienza dell'alimentazione, soprattutto per quanto riguarda l'elaborazione delle diete a scopo terapeutico.
	SCIENZE MOTORIE:Discipline che si occupano delle attività fisiche e dello sport, attraverso lo studio trasversale della medicina, della psicologia, della fisiologia e della didattica dello sport.
	FISIOTERAPIA: Branca della medicina che si occupa della prevenzione, cura e riabilitazione dei pazienti affetti da patologie o disfunzioni congenite o acquisite in ambito muscoloscheletrico, neurologico e viscerale attraverso molteplici interventi terapeutici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	"Scienze Alimentari" Dietistica "Scienze Motorie" Fisioterapia "Piu di una tra queste"))
	(assert	(attributo(nome BenSal2)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome BenSal2)(testo "Benessere e salute" )(valori "Scienze Alimentari" Dietistica "Scienze Motorie" Fisioterapia "Piu di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-SciAl 
	(declare (salience 949))
	(and(attributo(nome BenSal2)(valore "Piu di una tra queste"))
	(not(attributo (nome SciAl))))
=>
	(bind ?risposta (Domanda "Scienze Alimentari" 
	"SCIENZE ALIMENTARI:Studio relativo a tutti gli aspetti tecnici degli alimenti, cominciando dalla raccolta e dalla macellazione, per finire con la cottura ed il consumo."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciAl )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciAl )(testo "Scienze Alimentari" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Diet 
	(declare (salience 948))
	(and(attributo(nome BenSal2)(valore "Piu di una tra queste"))
	(not(attributo (nome Diet ))))
=>
	(bind ?risposta (Domanda "Dietistica" 
	"DIETISTICA:Applicazione della scienza dell'alimentazione, soprattutto per quanto riguarda l'elaborazione delle diete a scopo terapeutico."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Diet)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Diet)(testo "Dietistica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-SciMot 
	(declare (salience 947))
	(and(attributo(nome BenSal2)(valore "Piu di una tra queste"))
	(not(attributo (nome SciMot))))
=>
	(bind ?risposta (Domanda "Scienze Motorie" 
	"SCIENZE MOTORIE:Discipline che si occupano delle attività fisiche e dello sport, attraverso lo studio trasversale della medicina, della psicologia, della fisiologia e della didattica dello sport."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciMot)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciMot)(testo "Scienze Motorie" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Fisio 
	(declare (salience 946))
	(and(attributo(nome BenSal2)(valore "Piu di una tra queste"))
	(not(attributo (nome Fisio ))))
=>
	(bind ?risposta (Domanda "Fisioterapia" 
	"FISIOTERAPIA: Branca della medicina che si occupa della prevenzione, cura e riabilitazione dei pazienti affetti da patologie o disfunzioni congenite o acquisite in ambito muscoloscheletrico, neurologico e viscerale attraverso molteplici interventi terapeutici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Fisio)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Fisio)(testo "Fisioterapia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)


(defrule ask-for-Psich 
	(declare (salience 944))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Psich))))
=>
	(bind ?risposta (Domanda "Psichiatria" 
	"PSICHIATRIA:Branca specialistica della medicina che si occupa dello studio sperimentale, della prevenzione, della cura e della riabilitazione dei disturbi mentali"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Psich)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Psich)(testo "Psich" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Fisiopat 
	(declare (salience 943))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Fisiopat))))
=>
	(bind ?risposta (Domanda "Fisiopatologia" 
	"FISIOPATOLOGIA:Branca della medicina che si occupa dello studio, della cura e della prevenzione delle malattie."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Fisiopat)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Fisiopat)(testo "Fisiopatologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Pod 
	(declare (salience 942))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Pod ))))
=>
	(bind ?risposta (Domanda "Podologia" 
	"PODOLOGIA:Disciplina paramedica che tratta alcune affezioni minori del piede con metodi incruenti, ortesici e idro-massoterapici e svolge, su prescrizione medica, attività di prevenzione e di medicazione del piede stesso"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Pod)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Pod)(testo "Podologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Rad  
	(declare (salience 941))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Rad ))))
=>
	(bind ?risposta (Domanda "Radiologia" 
	"RADIOLOGIA:Branca della medicina che si occupa della produzione e dell'interpretazione a fini diagnostici o terapeutici di immagini radiologiche. È detta anche radiologia diagnostica o radiodiagnostica."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Rad)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Rad)(testo "Radiologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Inferm 
	(declare (salience 940))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Inferm ))))
=>
	(bind ?risposta (Domanda "Infermieristica" 
	"INFERMIERISTICA:Attività relativa all'assistenza terapeutica, palliativa, riabilitativa, educativa e preventiva rivolta all'individuo, alla comunità o alla popolazione, sia che essa sia svolta su soggetti sani o malati, al fine di recuperare, uno stato di salute ottimale e migliorare sempre più il proprio stato di salute o del prevenire l'insorgenza di alterazioni morfo-funzionali dell'individuo o della comunità."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Inferm )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Inferm )(testo "Infermieristica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Ost 
	(declare (salience 939))
	(and(or (attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Ost))))
=>
	(bind ?risposta (Domanda "Ostetricia" 
	"OSTETRICIA:Ramo delle professioni sanitarie che si occupa dell'assistenza alla donna durante la gravidanza, il parto ed il puerperio. Essa studia le normali modificazioni che avvengono all'interno del corpo femminile durante i nove mesi della gravidanza, durante le fasi del parto e durante il puerperio, l'immediato periodo dopo il parto. Si occupa inoltre di tutte le condizioni patologiche che possono insorgere a carico della madre e del sistema feto-placentare."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Ost)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Ost)(testo "Ostetricia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Biom  
	(declare (salience 938))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Biom ))))
=>
	(bind ?risposta (Domanda "Biomedicina" 
	"BIOMEDICINA:Branca della scienza medica che applica principi della biologia e delle scienze naturali alla pratica clinica,comporta lo studio dei processi patofisiologici con metodi propri di biologia, chimica e fisica"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Biom)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Biom )(testo "Biomedicina" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Endocrinologia 
	(declare (salience 937))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste"))(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome End ))))
=>
	(bind ?risposta (Domanda "Endocrinologia" 
	"ENDOCRINOLOGIA:branca della medicina interna che studia il sistema endocrino con particolare attenzione verso le patologie delle ghiandole a secrezione interna, ossia quelle il cui prodotto viene direttamente immesso nel sangue. Tali prodotti prendono il nome di ormoni"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome End)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome End)(testo "Endocrinologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Odontoiatria 
	(declare (salience 936))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Odont ))))
=>
	(bind ?risposta (Domanda "Odontoiatria" 
	"ODONTOIATRIA:Branca della medicina che si occupa della prevenzione, della diagnosi e della terapia medica e chirurgica delle patologie che colpiscono denti, gengive, ossa mascellari (mascellare superiore e inferiore o mandibola), articolazioni temporo-mandibolari (ATM), ghiandole salivari, tessuti neuro-muscolari e mucose orali."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Odont)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Odont)(testo "Odontoiatria" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Logopedia
	(declare (salience 935))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Logo))))
=>
	(bind ?risposta (Domanda "Logopedia " 
	"LOGOPEDIA:disciplina sanitaria che si occupa dello studio, della prevenzione, della valutazione e della cura delle patologie e dei disturbi della voce, del linguaggio, della comunicazione, della deglutizione e dei disturbi cognitivi connessi"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Logo)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Logo)(testo "Logopedia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)
(defrule ask-for-Pediatria
	(declare (salience 934))
	(and (or(attributo (nome ScienzeMed2)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed)(valore "Piu di una tra queste")) (attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Ped))))
=>
	(bind ?risposta (Domanda "Pediatria" 
	"PEDIATRIA:branca della medicina che si occupa dello sviluppo psicofisico dei bambini e della diagnosi e terapia delle malattie infantili"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Ped)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Ped)(testo "Pediatria" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Vet  
	(declare (salience 933))
	(and (or(attributo(nome ScienzeMed2)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Vet ))))
=>
	(bind ?risposta (Domanda "Veterinaria" 
	"VETERINARIA:branca delle scienze mediche che si occupa della salute e del benessere degli animali, del loro allevamento e dei prodotti che ne derivano, siano essi materiali che immateriali"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Vet)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Vet)(testo "Veterinaria" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Medicina 
	(declare (salience 932))
	(and (or(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Medicina))))
=>
	(bind ?risposta (Domanda "Medicina" 
	"MEDICINA: scienza che studia il corpo umano al fine di garantire la salute delle persone, in particolare riguardo alla definizione, prevenzione e cura delle malattie, oltre alle diverse modalità di alleviare le sofferenze dei malati"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Medicina)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Medicina)(testo "Medicina" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)


(defrule ask-for-Chir 
	(declare (salience 931))
	(and (or(attributo(nome ScienzeMed3)(valore "Piu di una tra queste"))(attributo (nome ScienzeMed4)(valore "Piu di una tra queste")))
	(not(attributo (nome Chir ))))
=>
	(bind ?risposta (Domanda "Chirurgia" 
	"CHIRURGIA:scienza che si occupa di studiare quelle malattie che potendo essere curate con le proprie mani vengono appunto dette chirurgiche."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Chir)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Chir)(testo "Chirurgia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)



(defrule ask-for-ScienzeIngegneristiche
	(declare (salience 930))
	(and(or (attributo (nome settore)(valore Scientifico))
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome Ing))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE INGEGNERISTICO" 
	"TODO In questo settore si studia..."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome Ing )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Ing)(testo "SETTORE INGEGNERISTICO")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeIng 
	(declare (salience 929))
	(and (attributo (nome Ing)(valore "Mi interessa")) 
	(not(attributo (nome ScienzeIng))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"ARCHITETTURA:  disciplina che ha come scopo l'organizzazione dello spazio a qualsiasi scala, ma principalmente quella in cui vive l'essere umano. Semplificando si può dire che essa attiene principalmente alla progettazione e costruzione di un immobile o dell'ambiente costruito
	DESIGN scienze applicate al fine di migliorare estetica, ergonomia, funzionalità e/o usabilità, produzione e commerciabilità di un prodotto
	INGEGNERIA:disciplina, a forte connotazione tecnico-scientifica, che ha come obiettivo l'applicazione di conoscenze e risultati delle scienze matematiche, fisiche e naturali per produrre sistemi e soluzioni in grado di soddisfare esigenze tecniche e materiali della società attraverso le fasi della progettazione, realizzazione e gestione degli stessi"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Architettura Design Ingegneria "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeIng)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeIng)(testo "Scegli la disciplina" )(valori Architettura Design Ingegneria "Più di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Arch
	(declare (salience 929))
	(and (attributo(nome ScienzeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome Arch))))
=>
	(bind ?risposta (Domanda "Architettura" 
	"ARCHITETTURA:  disciplina che ha come scopo l'organizzazione dello spazio a qualsiasi scala, ma principalmente quella in cui vive l'essere umano. Semplificando si può dire che essa attiene principalmente alla progettazione e costruzione di un immobile o dell'ambiente costruito"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Arch)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Arch)(testo "Architettura" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Design
	(declare (salience 929))
	(and (attributo(nome ScienzeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome Des))))
=>
	(bind ?risposta (Domanda "Design" 
	"DESIGN scienze applicate al fine di migliorare estetica, ergonomia, funzionalità e/o usabilità, produzione e commerciabilità di un prodotto"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Des)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Des)(testo "Design" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Ingegneria 
	(declare (salience 929))
	(and (attributo(nome ScienzeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome Ingegn))))
=>
	(bind ?risposta (Domanda "Ingegneria " 
	"INGEGNERIA:disciplina, a forte connotazione tecnico-scientifica, che ha come obiettivo l'applicazione di conoscenze e risultati delle scienze matematiche, fisiche e naturali per produrre sistemi e soluzioni in grado di soddisfare esigenze tecniche e materiali della società attraverso le fasi della progettazione, realizzazione e gestione degli stessi"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Ingegn)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Ingegn)(testo "Ingegneria" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-QualeIngegneria
	(declare (salience 928))
	(and (or(attributo(nome Ingegn)(valore Si)) (attributo(nome ScienzeIng)(valore Ingegneria)))
	(not(attributo (nome qualeIng ))))
=>
	(bind ?risposta (Domanda "Quale tipo di indirizzo ingegneristico preferisci? " 
	"CIVILE: ramo dell'ingegneria preposto alla progettazione di manufatti e infrastrutture destinati all'uso civile e quindi a tutti gli ambiti relativi: edili, geotecnici, infrastrutturali, idraulici, strutturali, urbanistici.
	EDILE:branca dell'ingegneria che si occupa della progettazione, direzione lavori, produzione cantieristica, collaudo, manutenzione degli edifici ad uso civile e non.
	AMBIENTALE:branca dell'ingegneria che nasce dall'esigenza di soddisfare la necessità, propria di ogni paese industriale ed avanzato, di professionisti capaci di operare in un contesto delicato e dall'importanza ormai sempre crescente come quello ambientale
	INDUSTRIALE:settore dell'ingegneria che si occupa della progettazione, realizzazione e gestione di sistemi e automatismi meccanici e industriali. In particolare si occupa, dal punto di vista della ricerca e delle applicazioni pratiche, dei procedimenti, delle misure e delle infrastrutture necessarie per sviluppare e realizzare sistemi integrati di persone, sapere, attrezzatura, energia e materiali atti allo sfruttamento delle leggi naturali.
	INFORMATICA: ramo dell'ingegneria, derivato in parte dall'ingegneria elettronica, che applica principi di quest'ultima e di informatica pura alla progettazione di sistemi e soluzioni per elaborare informazioni e dati.
	ELETTRONICA: ramo dell'ingegneria che applica principi di elettrologia, elettrotecnica, elettronica, elettromagnetismo e di altre discipline collegate alla progettazione di componenti, circuiti, apparati e sistemi elettronici
	MECCANICA:ramo dell'ingegneria che applica principi di fisica, scienza dei materiali e di altre discipline collegate alla progettazione di componenti e sistemi meccanici
	GESTIONALE:ramo dell'ingegneria che studia, con approccio quantitativo e qualitativo, gli aspetti organizzativi, operativi e tecnici delle imprese, siano esse industriali o di servizio
	CHIMICA: ramo dell'ingegneria che applica principi di fisica, chimica, scienza dei materiali e di altre discipline collegate alla progettazione di sistemi e soluzioni per produrre in serie prodotti chimici, petrolchimici e farmaceutici.
	ELETTRICA:ramo dell'ingegneria che si occupa dei metodi per produrre e dispensare elettricità e delle applicazioni pratiche dell'elettromagnetismo e dell'elettromeccanica.
	AEROSPAZIALE:ramo dell'ingegneria che applica principi di fisica, scienza dei materiali e di altre discipline collegate alla progettazione di aeromobili e veicoli spaziali.
	COSTRUZIONI:ramo dell'ingegneria che forma una figura professionale di operatore nel campo dell'architettura, dell'ingegneria e dell'edilizia, che concorra e collabori, in diversi ambiti, alle attività di programmazione, progettazione, attuazione e gestione degli interventi di trasformazione dell'ambiente costruito
	BIOMEDICA:ramo dell'ingegneria che applica principi di fisica, chimica, biologia, scienza dei materiali e di altre discipline collegate alla progettazione di sistemi e soluzioni per le scienze biomediche. La finalità di tale integrazione è prevalentemente rivolta all’ambito tecnologico, industriale, scientifico, clinico, ospedaliero.
	DEL SUONO:si occupa, in generale, delle applicazioni riguardanti la produzione, trasmissione, registrazione e riproduzione del suono attraverso dispositivi meccanici, elettronici o informatici."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Civile Edile Ambientale Industriale Informatica Elettronica Meccanica Gestionale Chimica Elettrica Aerospaziale Costruzioni Biomedica "Del suono" "Piu di una tra queste"))
	(assert	(attributo(nome qualeIng)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome qualeIng)(testo "Quale ingegneria?" )(valori Civile Edile Ambientale Industriale Informatica Elettronica Meccanica Gestionale Chimica Elettrica Aerospaziale Costruzioni Biomedica "Del suono" "Piu di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Civile  
	(declare (salience 927))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngCivile))))
=>
	(bind ?risposta (Domanda "Ingegneria Civile" 
	"CIVILE: ramo dell'ingegneria preposto alla progettazione di manufatti e infrastrutture destinati all'uso civile e quindi a tutti gli ambiti relativi: edili, geotecnici, infrastrutturali, idraulici, strutturali, urbanistici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngCivile)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngCivile)(testo "Ingegneria Civile" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Edile  
	(declare (salience 926))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngEdile))))
=>
	(bind ?risposta (Domanda "Ingegneria Edile" 
	"EDILE:branca dell'ingegneria che si occupa della progettazione, direzione lavori, produzione cantieristica, collaudo, manutenzione degli edifici ad uso civile e non."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngEdile)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngEdile)(testo "Ingegneria Edile" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Ambientale 
	(declare (salience 925))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngAmbient))))
=>
	(bind ?risposta (Domanda "Ingegneria Ambientale" 
	"AMBIENTALE:branca dell'ingegneria che nasce dall'esigenza di soddisfare la necessità, propria di ogni paese industriale ed avanzato, di professionisti capaci di operare in un contesto delicato e dall'importanza ormai sempre crescente come quello ambientale"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngAmbient)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngAmbient)(testo "Ingegneria Ambientale" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Industriale  
	(declare (salience 924))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngInd))))
=>
	(bind ?risposta (Domanda "Ingegneria Industriale" 
	"INDUSTRIALE:settore dell'ingegneria che si occupa della progettazione, realizzazione e gestione di sistemi e automatismi meccanici e industriali. In particolare si occupa, dal punto di vista della ricerca e delle applicazioni pratiche, dei procedimenti, delle misure e delle infrastrutture necessarie per sviluppare e realizzare sistemi integrati di persone, sapere, attrezzatura, energia e materiali atti allo sfruttamento delle leggi naturali."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngInd)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngInd)(testo "Ingegneria Industriale" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-IngInformatica  
	(declare (salience 923))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngInf))))
=>
	(bind ?risposta (Domanda "Ingegneria Informatica" 
	"INFORMATICA: ramo dell'ingegneria, derivato in parte dall'ingegneria elettronica, che applica principi di quest'ultima e di informatica pura alla progettazione di sistemi e soluzioni per elaborare informazioni e dati."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngInf)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngInf)(testo "Ingegneria Informatica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Elettronica  
	(declare (salience 922))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngElettro))))
=>
	(bind ?risposta (Domanda "Ingegneria Elettronica" 
	"ELETTRONICA: ramo dell'ingegneria che applica principi di elettrologia, elettrotecnica, elettronica, elettromagnetismo e di altre discipline collegate alla progettazione di componenti, circuiti, apparati e sistemi elettronici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngElettro)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngElettro)(testo "Ingegneria Elettronica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Meccanica  
	(declare (salience 921))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngMecc))))
=>
	(bind ?risposta (Domanda "Ingegneria Meccanica" 
	"MECCANICA:ramo dell'ingegneria che applica principi di fisica, scienza dei materiali e di altre discipline collegate alla progettazione di componenti e sistemi meccanici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngMecc)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngMecc)(testo "Ingegneria Meccanica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Gestionale  
	(declare (salience 920))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngGest ))))
=>
	(bind ?risposta (Domanda "Ingegneria Gestionale" 
	"GESTIONALE:ramo dell'ingegneria che studia, con approccio quantitativo e qualitativo, gli aspetti organizzativi, operativi e tecnici delle imprese, siano esse industriali o di servizio"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngGest)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngGest)(testo "Ingegneria Gestionale" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-IngChimica  
	(declare (salience 919))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngChimica))))
=>
	(bind ?risposta (Domanda "Ingegneria Chimica" 
	"CHIMICA: ramo dell'ingegneria che applica principi di fisica, chimica, scienza dei materiali e di altre discipline collegate alla progettazione di sistemi e soluzioni per produrre in serie prodotti chimici, petrolchimici e farmaceutici."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngChimica)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngChimica)(testo "Ingegneria Chimica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Elettrica 
	(declare (salience 918))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngElettri))))
=>
	(bind ?risposta (Domanda "Ingegneria Elettrica" 
	"ELETTRICA:ramo dell'ingegneria che si occupa dei metodi per produrre e dispensare elettricità e delle applicazioni pratiche dell'elettromagnetismo e dell'elettromeccanica."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngElettri)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngElettri)(testo "Ingegneria Elettrica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Aerospaziale 
	(declare (salience 916))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngAerosp))))
=>
	(bind ?risposta (Domanda "Ingegneria Aerospaziale" 
	"AEROSPAZIALE:ramo dell'ingegneria che applica principi di fisica, scienza dei materiali e di altre discipline collegate alla progettazione di aeromobili e veicoli spaziali."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngAerosp)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngAerosp)(testo "Ingegneria Aerospaziale" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Costruzioni  
	(declare (salience 915))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngCostr))))
=>
	(bind ?risposta (Domanda "Ingegneria Costruzioni" 
	"COSTRUZIONI:ramo dell'ingegneria che forma una figura professionale di operatore nel campo dell'architettura, dell'ingegneria e dell'edilizia, che concorra e collabori, in diversi ambiti, alle attività di programmazione, progettazione, attuazione e gestione degli interventi di trasformazione dell'ambiente costruito"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngCostr)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngCostr)(testo "Ingegneria Costruzioni" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-IngBiomedica 
	(declare (salience 914))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngBiomedica ))))
=>
	(bind ?risposta (Domanda "Ingegneria Biomedica" 
	"BIOMEDICA:ramo dell'ingegneria che applica principi di fisica, chimica, biologia, scienza dei materiali e di altre discipline collegate alla progettazione di sistemi e soluzioni per le scienze biomediche. La finalità di tale integrazione è prevalentemente rivolta all’ambito tecnologico, industriale, scientifico, clinico, ospedaliero."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngBiomedica)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngBiomedica)(testo "Ingegneria Biomedica" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Suono  
	(declare (salience 913))
	(and (attributo(nome qualeIng)(valore "Piu di una tra queste"))
	(not(attributo (nome IngSuono))))
=>
	(bind ?risposta (Domanda "Ingegneria del Suono" 
	"DEL SUONO:si occupa, in generale, delle applicazioni riguardanti la produzione, trasmissione, registrazione e riproduzione del suono attraverso dispositivi meccanici, elettronici o informatici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome IngSuono)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome IngSuono)(testo "Ingegneria del Suono" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeEconomicoStatistiche
	(declare (salience 910))
	(and(or (attributo (nome settore)(valore Scientifico))
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome EcoStat))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE ECONOMICO-STATISTICO  " 
	"In questo settore si studia..."
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome EcoStat )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome EcoStat)(testo "SETTORE ECONOMICO-STATISTICO ")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeEcoStat 
	(declare (salience 909))
	(and (attributo (nome EcoStat)(valore "Mi interessa")) 
	(not(attributo (nome ScienzeEcoStat))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"ECONOMIA:Scienza sociale che si occupa dei metodi con cui l'uomo usa razionalmente poche risorse per soddisfare molte esigenze.
	STATISTICA:disciplina che ha come fine lo studio quantitativo e qualitativo di un particolare fenomeno in condizioni di incertezza o non determinismo, cioè di non completa conoscenza di esso o parte di esso"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Economia Statistica Entrambe))
	(assert	(attributo(nome ScienzeEcoStat)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeEcoStat)(testo "Scegli la disciplina" )(valori Economia Statistica Entrambe)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)



(defrule ask-for-ScienzePoliticoSociali
	(declare (salience 905))
	(and(or (attributo (nome settore)(valore Umanistico))
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome PolSoc))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE POLITICO-SOCIALE" 
	"In questo settore si studia..."
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome PolSoc )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome PolSoc)(testo "SETTORE POLITICO-SOCIALE")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzePolSoc  
	(declare (salience 904))
	(and (attributo (nome PolSoc)(valore "Mi interessa")) 
	(not(attributo (nome ScienzePolSoc))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"SCIENZE POLITICHE: scienza sociale che studia il fenomeno politico attraverso la metodologia delle scienze empiriche
	SCIENZE SOCIALI: discipline che studiano l'essere umano e la società, in particolare l'origine e lo sviluppo delle società umane, le istituzioni, le relazioni sociali e i fondamenti della vita sociale
	TURISMO:indirizzo specializzato per prepararsi a lavorare nell’organizzazione dei servizi turistici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	"Scienze Politiche" "Scienze Sociali" Turismo "Piu di una tra queste"))
	(assert	(attributo(nome ScienzePolSoc)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzePolSoc)(testo "Scegli la disciplina" )(valori "Scienze Politiche" "Scienze Sociali" Turismo "Piu di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-SciPol  
	(declare (salience 903))
	(and (attributo(nome ScienzePolSoc)(valore "Piu di una tra queste"))
	(not(attributo (nome SciPol))))
=>
	(bind ?risposta (Domanda "Scienze Politiche" 
	"SCIENZE POLITICHE: scienza sociale che studia il fenomeno politico attraverso la metodologia delle scienze empiriche"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciPol)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciPol)(testo "Scienze Politiche" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-SciSoc  
	(declare (salience 902))
	(and (attributo(nome ScienzePolSoc)(valore "Piu di una tra queste"))
	(not(attributo (nome SciSoc))))
=>
	(bind ?risposta (Domanda "Scienze Sociali " 
	"SCIENZE SOCIALI: discipline che studiano l'essere umano e la società, in particolare l'origine e lo sviluppo delle società umane, le istituzioni, le relazioni sociali e i fondamenti della vita sociale"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciSoc)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciSoc)(testo "Scienze Sociali " )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Tur  
	(declare (salience 901))
	(and (attributo(nome ScienzePolSoc)(valore "Piu di una tra queste"))
	(not(attributo (nome Tur))))
=>
	(bind ?risposta (Domanda "Turismo" 
	"TURISMO:indirizzo specializzato per prepararsi a lavorare nell’organizzazione dei servizi turistici"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Tur)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Tur)(testo "Turismo" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeAntichitaFilologicheArtistiche
	(declare (salience 900))
	(and(or (attributo (nome settore)(valore Umanistico))
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome Ant ))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE ANTICHITA FILOSOFIA ARTE" 
	"In questo settore si studia..."
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome Ant )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Ant)(testo "SETTORE ANTICHITA FILOSOFIA  ARTE")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeAnt   
	(declare (salience 899))
	(and (attributo (nome Ant)(valore "Mi interessa")) 
	(not(attributo (nome ScienzeAnt))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"LETTERE: discipline accademiche che studiano l'uomo e la condizione umana, utilizzando principalmente strumenti analitici, critici oppure speculativi a differenza dell'empirismo proprio della scienza 
	ARCHEOLOGIA: scienza che studia le civiltà e le culture umane del passato e le loro relazioni con l'ambiente circostante, mediante la raccolta, la documentazione e l'analisi delle tracce materiali che hanno lasciato (architetture, manufatti, resti biologici e umani)
	BENI CULTURALI:Studio di  tutti i beni designati da ciascuno Stato come importanti per l'archeologia, la letteratura, l'arte, la scienza, la demologia, l'etnologia o l'antropologia.Si contrappongono, per definizione, ai beni naturali in quanto questi ultimi ci sono offerti dalla natura, mentre i primi sono il prodotto della cultura.
	MUSICOLOGIA:studio del fenomeno musicale nel mondo, condotto non attraverso un approccio di tipo tecnico-pratico (ossia della pratica musicale svolta dal musicista nelle qualità di creatore, operatore, interprete) o storico-estetico (la quale può essere anche svolta da umanisti professionisti e non professionisti), ma secondo un approccio di tipo scientifico."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Lettere Archeologia "Beni culturali" Musicologia "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeAnt)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeAnt)(testo "Scegli la disciplina" )(valori Lettere Archeologia "Beni culturali" Musicologia "Piu di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Lettere  
	(declare (salience 898))
	(and (attributo(nome ScienzeAnt)(valore "Piu di una tra queste"))
	(not(attributo (nome Lett))))
=>
	(bind ?risposta (Domanda "Lettere" 
	"LETTERE: discipline accademiche che studiano l'uomo e la condizione umana, utilizzando principalmente strumenti analitici, critici oppure speculativi a differenza dell'empirismo proprio della scienza"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Lett)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Lett)(testo "Lettere" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Archeologia 
	(declare (salience 897))
	(and (attributo(nome ScienzeAnt)(valore "Piu di una tra queste"))
	(not(attributo (nome Arche ))))
=>
	(bind ?risposta (Domanda "Archeologia" 
	"ARCHEOLOGIA: scienza che studia le civiltà e le culture umane del passato e le loro relazioni con l'ambiente circostante, mediante la raccolta, la documentazione e l'analisi delle tracce materiali che hanno lasciato (architetture, manufatti, resti biologici e umani)"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Arche)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Arche)(testo "Archeologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)
(defrule ask-for-BeniCulturali  
	(declare (salience 896))
	(and (attributo(nome ScienzeAnt)(valore "Piu di una tra queste"))
	(not(attributo (nome BenCult ))))
=>
	(bind ?risposta (Domanda "Beni culturali" 
	"BENI CULTURALI:Studio di  tutti i beni designati da ciascuno Stato come importanti per l'archeologia, la letteratura, l'arte, la scienza, la demologia, l'etnologia o l'antropologia.Si contrappongono, per definizione, ai "beni naturali" in quanto questi ultimi ci sono offerti dalla natura, mentre i primi sono il prodotto della cultura."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome BenCult)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome BenCult)(testo "Beni culturali" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Musicologia 
	(declare (salience 895))
	(and (attributo(nome ScienzeAnt)(valore "Piu di una tra queste"))
	(not(attributo (nome Music ))))
=>
	(bind ?risposta (Domanda "Musicologia" 
	"MUSICOLOGIA:studio del fenomeno musicale nel mondo, condotto non attraverso un approccio di tipo tecnico-pratico (ossia della pratica musicale svolta dal musicista nelle qualità di creatore, operatore, interprete) o storico-estetico (la quale può essere anche svolta da umanisti professionisti e non professionisti), ma secondo un approccio di tipo scientifico"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Music)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Music)(testo "Musicologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)


(defrule ask-for-ScienzeStoricheFilosofichePedagogichePsicologiche
	(declare (salience 890))
	(and(or (attributo (nome settore)(valore Umanistico))
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome Stor ))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE STORICO FILOSOFICO PEDAGOGICO E PSICOLOGICO  " 
	"In questo settore si studia..."
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome Stor )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Stor)(testo "SETTORE STORICO FILOSOFICO PEDAGOGICO E PSICOLOGICO")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeStoriche    
	(declare (salience 889))
	(and (attributo (nome Stor)(valore "Mi interessa")) 
	(not(attributo (nome ScienzeStor ))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"PSICOLOGIA:disciplina, afferente alle scienze umane, che studia il comportamento e la mente, attraverso lo studio dei processi psichici, mentali e cognitivi nelle loro componenti consce e inconsce, mediante l'uso del metodo scientifico e/o appoggiandosi ad una prospettiva soggettiva intrapersonale. Tale studio riguarda quindi i processi cognitivi e intrapsichici dell'individuo, il comportamento umano individuale e di gruppo, e i rapporti tra il soggetto e l'ambiente.
	SCIENZE UMANE: discipline che studiano l'essere umano e la società, in particolare l'origine e lo sviluppo delle società umane, le istituzioni, le relazioni sociali e i fondamenti della vita sociale
	SCIENZA DELLA COMUNICAZIONE:scienze sociali che studiano la comunicazione umana. In ambito accademico quando si parla di comunicazione si allude quasi sempre alle comunicazioni di massa (giornalismo, radio, televisione, cinema, nuovi media) e ai processi comunicativi di tipo istituzionale o professionale, cioè la comunicazione pubblica (intesa come comunicazione della pubblica amministrazione), la comunicazione sociale e la comunicazione d'impresa, comprendente la pubblicità, le pubbliche relazioni e alcuni segmenti del marketing
	SOCIOLOGIA: scienza sociale che studia i fenomeni della società umana,[1] indagando i loro effetti e le loro cause, in rapporto con l'individuo e il gruppo sociale. Un'altra definizione, più restrittiva, definisce la sociologia come lo studio scientifico della società
	LOGOPEDIA:disciplina sanitaria che si occupa dello studio, della prevenzione, della valutazione e della cura delle patologie e dei disturbi della voce, del linguaggio, della comunicazione, della deglutizione e dei disturbi cognitivi connessi
	PEDIATRIA:branca della medicina che si occupa dello sviluppo psicofisico dei bambini e della diagnosi e terapia delle malattie infantili.
	FILOSOFIA:campo di studi che si pone domande e riflette sul mondo e sull'essere umano, indaga sul senso dell'essere e dell'esistenza umana, tenta di definire la natura e analizza le possibilità e i limiti della conoscenza.
	PEDAGOGIA: disciplina umanistica che studia l'educazione e la formazione dell'uomo nella sua interezza ovvero lungo il suo intero ciclo di vita. Si occupa dei diversi approcci educativi che coinvolgono l'uomo e la donna nei diversi momenti e situazioni dello sviluppo: non solo quindi l'età infantile ma tipicamente anche l'adolescenza, l'età adulta, la vecchiaia (o terza età), la condizione di disabilità
	SCIENZA DELLA FORMAZIONE:disciplina trasversale che trae principalmente le proprie basi della pedagogia, dalla psicologia, dalla filosofia e dalla sociologia."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Psicologia "Scienze Umane" "Scienza della comunicazione" Sociologia Logopedia Pediatria Filosofia Pedagogia "Scienza della formazione" "Piu di una tra queste"))
	(assert	(attributo(nome ScienzeStor)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeStor)(testo "Scegli la disciplina" )(valori Psicologia "Scienze Umane" "Scienza della comunicazione" Sociologia Logopedia Pediatria Filosofia Pedagogia "Scienza della formazione" "Piu di una tra queste")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Psicologia
	(declare (salience 888))
	(and (attributo(nome ScienzeStor)(valore "Piu di una tra queste"))
	(not(attributo (nome Psic ))))
=>
	(bind ?risposta (Domanda "Psicologia" 
	"PSICOLOGIA:disciplina, afferente alle scienze umane, che studia il comportamento e la mente, attraverso lo studio dei processi psichici, mentali e cognitivi nelle loro componenti consce e inconsce, mediante l'uso del metodo scientifico e/o appoggiandosi ad una prospettiva soggettiva intrapersonale. Tale studio riguarda quindi i processi cognitivi e intrapsichici dell'individuo, il comportamento umano individuale e di gruppo, e i rapporti tra il soggetto e l'ambiente."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Psic)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Psic)(testo "Psicologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeUmane 
	(declare (salience 887))
	(and (attributo(nome ScienzeStor)(valore "Piu di una tra queste"))
	(not(attributo (nome SciUm  ))))
=>
	(bind ?risposta (Domanda "Scienze Umane" 
	"SCIENZE UMANE: discipline che studiano l'essere umano e la società, in particolare l'origine e lo sviluppo delle società umane, le istituzioni, le relazioni sociali e i fondamenti della vita sociale"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciUm)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciUm)(testo "Scienze Umane" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)
(defrule ask-for-SciCom 
	(declare (salience 886))
	(and (attributo(nome ScienzeStor)(valore "Piu di una tra queste"))
	(not(attributo (nome SciCom ))))
=>
	(bind ?risposta (Domanda "Scienze della comunicazione" 
	"SCIENZA DELLA COMUNICAZIONE:scienze sociali che studiano la comunicazione umana. In ambito accademico quando si parla di comunicazione si allude quasi sempre alle comunicazioni di massa (giornalismo, radio, televisione, cinema, nuovi media) e ai processi comunicativi di tipo istituzionale o professionale, cioè la comunicazione pubblica (intesa come comunicazione della pubblica amministrazione), la comunicazione sociale e la comunicazione d'impresa, comprendente la pubblicità, le pubbliche relazioni e alcuni segmenti del marketing"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciCom)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciCom)(testo "Scienze della comunicazione" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)
(defrule ask-for-Sociologia
	(declare (salience 885))
	(and (attributo(nome ScienzeStor)(valore "Piu di una tra queste"))
	(not(attributo (nome Sociolog  ))))
=>
	(bind ?risposta (Domanda "Sociologia" 
	"SOCIOLOGIA: scienza sociale che studia i fenomeni della società umana,[1] indagando i loro effetti e le loro cause, in rapporto con l'individuo e il gruppo sociale. Un'altra definizione, più restrittiva, definisce la sociologia come lo studio scientifico della società"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Sociolog)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Sociolog)(testo "Sociologia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-Filosofia
	(declare (salience 882))
	(and (attributo(nome ScienzeStor)(valore "Piu di una tra queste"))
	(not(attributo (nome Filo  ))))
=>
	(bind ?risposta (Domanda "Filosofia" 
	"FILOSOFIA:campo di studi che si pone domande e riflette sul mondo e sull'essere umano, indaga sul senso dell'essere e dell'esistenza umana, tenta di definire la natura e analizza le possibilità e i limiti della conoscenza."
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Filo)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Filo)(testo "Filosofia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeFormazione
	(declare (salience 880))
	(and (attributo(nome ScienzeStor)(valore "Piu di una tra queste"))
	(not(attributo (nome SciForm ))))
=>
	(bind ?risposta (Domanda "Scienze della formazione" 
	"SCIENZA DELLA FORMAZIONE:disciplina trasversale che trae principalmente le proprie basi della pedagogia, dalla psicologia, dalla filosofia e dalla sociologia"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome SciForm)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome SciForm)(testo "Scienze della formazione" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)
(defrule ask-for-Pedagogia
	(declare (salience 879))
	(and (attributo(nome ScienzeStor)(valore "Piu di una tra queste"))
	(not(attributo (nome Pedag))))
=>
	(bind ?risposta (Domanda "Pedagogia" 
	"PEDAGOGIA: disciplina umanistica che studia l'educazione e la formazione dell'uomo nella sua interezza ovvero lungo il suo intero ciclo di vita. Si occupa dei diversi approcci educativi che coinvolgono l'uomo e la donna nei diversi momenti e situazioni dello sviluppo: non solo quindi l'età infantile ma tipicamente anche l'adolescenza, l'età adulta, la vecchiaia (o terza età), la condizione di disabilità"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Si No))
	(assert	(attributo(nome Pedag)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Pedag)(testo "Pedagogia" )(valori Si No)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)


(defrule ask-for-ScienzeGiuridiche 
	(declare (salience 875))
	(and(or (attributo (nome settore)(valore Umanistico))
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome Giur ))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE GIURIDICO" 
	"In questo settore si studia..."
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome Giur)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Giur)(testo "SETTORE GIURIDICO")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeLinguistiche
	(declare (salience 870))
	(and(or (attributo (nome settore)(valore Umanistico))
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scientifico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore costruzioni))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore elettronico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore informatico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore meccanico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore trasporti))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore industriale))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore classico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore artistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore musicale))) 
	(and (attributo (nome prosegui)(valore Si)) (attributo(nome liceo) (valore linguistico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome liceo) (valore scienzeUmane))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore agrario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore amministrazioneFinanzaMarketing))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore chimico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore grafico))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore moda))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome tecnico) (valore turismo))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore alberghiero))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore sanitario))) 
	(and (attributo (nome prosegui)(valore No)) (attributo(nome professionale) (valore manutenzione))))
	(not(attributo (nome Ling))))
=>
	(printout t "-------------------------------------------------------------------------------------------"crlf)
	(bind ?risposta (Domanda "SETTORE LINGUISTICO" 
	"In questo settore si studia..."
	"Ti consigliero' l'universita piu adatta alle tue preferenze" 
	"Mi interessa" "Non mi interessa"))
	(assert	(attributo(nome Ling )(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome Ling)(testo "SETTORE LINGUISTICO")(valori "Mi interessa" "Non mi interessa")(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)

(defrule ask-for-ScienzeLing     
	(declare (salience 869))
	(and (attributo (nome Ling)(valore "Mi interessa")) 
	(not(attributo (nome ScienzeLing ))))
=>
	(bind ?risposta (Domanda "Scegli tra queste discipline" 
	"LINGUE:Disciplina scientifica che studia il linguaggio umano (inteso come la capacità dell'uomo di comunicare) e le sue manifestazioni (le lingue parlate nel mondo)
	INTERPRETARIATO:Disciplina che studia l'attività che consiste nello stabilire una comunicazione orale o gestuale tra due o più attori di una conversazione che non condividono lo stesso codice linguistico"
	"Ti consigliero' un'Universita in cui vengono trattati gli argomenti che piu ti interessano" 
	Lingue interpretariato Entrambe))
	(assert	(attributo(nome ScienzeLing)(valore ?risposta)(cf 1.0)(id (+ ?*idattr* 1))))
	(assert (domande (nome ScienzeLing)(testo "Scegli la disciplina" )(valori Lingue interpretariato Entrambe)(valore ?risposta)(id (+ ?*idattr* 1))))
	(bind ?*idattr* (+ ?*idattr* 1))
)



;;STAMPA 

(deffunction mostra (?nome ?regione ?tipo ?cdL ?sedi ?scheda ?rettore ?cff)
	(printout t crlf "HO TROVATO L'UNIVERSITA CHE FA PER TE!" crlf)
	(printout t "____________________________________________________________________________________" crlf )
	(printout t ?nome  crlf)
	(printout t "E un'Università" ?tipo " situata in " ?regione ",le cui sedi sono: "?sedi crlf)
	(printout t "Eroga i seguenti cdL:" ?cdL crlf)
	(printout t "Rettore: " ?rettore  crlf )
	(printout t "Se sei interessato puoi consultare qualche info aggiuntiva al sito:" ?scheda  crlf crlf)
	(printout t "C.F.: " (* ?cff 100) "%" crlf)
	(printout t  "____________________________________________________________________________________" crlf crlf)  
)




(defrule stampa
(declare(salience 7))
    ?u<-(università(nome ?n)(regione $?r)(tipo ?t)(cdL $?c)(sedi $?s) (scheda ?sc) (rettore ?rett)(cf ?cf&:(> ?cf 0.9)))
=>
	(mostra ?n ?r ?t ?c ?s ?sc ?rett ?cf)
	(printout t crlf)
	(printout t crlf)
	(assert (descrizione ok))
	(assert (stampa si))
)

(defrule stampa-NO
(declare(salience 5))
     (not(stampa si))  
=>	
	(printout t crlf "NON HO POTUTO CONSIGLIARTI NULLA" crlf)
	(printout t "******************************************" crlf )
	(assert (descrizione ok))
	(assert (stampa si))
	(assert (blocca si))
)




;RITRATTAZIONE 

(defrule ritrattazione
	(declare (salience 1))
	?stp<-(stampa si)
	?u<-(descrizione ok)
=>
	(bind ?rispostaId 0)
	(printout t "Ti abbiamo mostrato tutto cio' perche' hai espresso le seguenti preferenze" crlf crlf)
	(do-for-all-facts ((?a domande))

		(printout t ?a:id " - " ?a:testo ": -- " ?a:valore "  ---  "?a:valori  crlf)
	)
	(printout t crlf)
	(bind ?risposta (Domanda "Vuoi modificare alcune preferenze" "" "" si no))
	(if (eq ?risposta si)
		then
		(bind ?flag FALSE)
		(while (eq ?flag FALSE) do 
			(printout t "Inserisci il numero corrispondente alla preferenza da modificare" crlf)
			(bind ?rispostaId (read))
			(if (and(numberp ?rispostaId)(<= ?rispostaId ?*idattr*)(neq ?rispostaId 0)) then (bind ?flag TRUE))
			(delayed-do-for-all-facts ((?m università)) (< ?m:cf 1)(modify ?m (cf 0.9) ))
			(retract ?u)
			(retract ?stp)

			(bind ?*var* 0)
		)
	
	)
	(if (eq ?risposta no) then
	(halt)
	)

	(do-for-all-facts ((?att attributo)) (>= ?att:id ?rispostaId) (retract ?att))
	(do-for-all-facts ((?dom domande)) (> ?dom:id ?rispostaId) (retract ?dom))
	(bind ?*idattr* ?rispostaId)
	(do-for-all-facts ((?att attributo)) (< ?att:id ?rispostaId)(retract ?att))
	(do-for-all-facts ((?dom domande)) (< ?dom:id ?rispostaId) 
	(assert(attributo(nome ?dom:nome)(valore ?dom:valore)(id ?dom:id)))
	)
	(do-for-all-facts ((?dom domande)) (eq ?dom:id ?rispostaId)
	(bind ?risposta (Domanda ?dom:testo "" "" $?dom:valori))	
	(assert(attributo(nome ?dom:nome)(valore ?risposta)(id ?dom:id)))
	(modify ?dom (valore ?risposta))
	)
)


