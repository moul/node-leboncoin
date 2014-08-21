regions_common =
  ['', 'occasions', 'bonnes_affaires']

regions_tree =
  alsace: [
    'bas_rhin'
    'haut_rhin'
    ]
  aquitaine: []
  auvergne: []
  basse_normandie: []
  bourgogne: []
  bretagne: []
  centre: []
  champagne_ardenne: []
  corse: []
  franche_comte: []
  haute_normandie: [
    'eure'
    'seine_maritime'
    ]
  ile_de_france: [
    "paris"
    "seine_et_marne"
    "yvelines"
    "essonne"
    "hauts_de_seine"
    "seine_saint_denis"
    "val_de_marne"
    "val_d_oise"
    ]
  languedoc_rousillon: []
  limousin: []
  lorraine: []
  midi_pyrenees: []
  nord_pas_de_calais: []
  pays_de_la_loire: []
  picardie: []
  poitou_charentes: []
  provence_alpes_cote_d_azur: []
  rhone_alpes: []
  guadeloupe: []
  martinique: []
  guyane: []
  reunion: []

categories_tree =
  _vehicules_:
    voitures: {}
    motos:  {}
    caravaning: {}
    utilitaires: {}
    equipement_auto: {}
    equipement_moto: {}
    equipement_caravaning: {}
    nautisme: {}
    equipement_nautisme: {}
  _immobilier_:
    ventes_immobilieres: {}
    locations:
      mrs:            # loyer min
        type: Number
      mre:            # loyer max
        type: Number
      ros:            # pieces min
        type: Number
      roe:            # pieces max
        type: Number
      sqs:            # surface min
        type: 'list'
        values:
          0:  0
          1:  20
          2:  25
          3:  30
          4:  35
          5:  40
          6:  50
          7:  60
          8:  70
          9:  80
          10: 90
          11: 100
          12: 110
          13: 120
          14: 150
          15: 300
      sqe:            # surface max
        type: 'list'
        values:
          0:  0
          1:  20
          2:  25
          3:  30
          4:  35
          5:  40
          6:  50
          7:  60
          8:  70
          9:  80
          10: 90
          11: 100
          12: 110
          13: 120
          14: 150
          15: 300
          16: '350+'
      ret:
        type: 'array'
        values:
          1: 'maison'
          2: 'appartement'
          3: 'terrain'
          4: 'parking'
          5: 'autre'
    colocations: {}
    locations_de_vacances: {}
    bureaux_commerces: {}
  _multimedia_: {}              # TODO
  _maison_: {}                  # TODO
  _loisirs_: {}                 # TODO
  _emploi_services_: {}         # TODO
  _:
    autres: {}

module.exports =
  regions_tree:     regions_tree
  regions:      k for k, v of regions_tree
  categories_tree:  categories_tree
  categories:     k for k, v of categories_tree
