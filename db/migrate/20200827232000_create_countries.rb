# encoding: utf-8
class CreateCountries < ActiveRecord::Migration[4.2]
  def self.up
    create_table :countries do |t|
      t.column :code,     :string,  :null => false,   :limit => 10
      t.column :name,     :string,  :null => false,   :limit => 100
      t.column :iso3,     :string,  :null => false,   :limit => 3
      t.column :numeric,  :integer, :null => false
      t.column :eu,       :boolean, :null => false,   :default => false
    
      t.timestamps
    
    end

    add_index :countries, :code, :unique => true

    Country.create!(
            :code => "AF",
            :name => "Afghanistan",
            :iso3 => "AFG",
            :numeric => 4,
            :eu => false)

    Country.create!(
            :code => "AL",
            :name => "Albania",
            :iso3 => "ALB",
            :numeric => 8,
            :eu => false)

    Country.create!(
            :code => "DZ",
            :name => "Algeria",
            :iso3 => "DZA",
            :numeric => 12,
            :eu => false)

    Country.create!(
            :code => "AS",
            :name => "American Samoa",
            :iso3 => "ASM",
            :numeric => 16,
            :eu => false)

    Country.create!(
            :code => "AD",
            :name => "Andorra",
            :iso3 => "AND",
            :numeric => 20,
            :eu => false)

    Country.create!(
            :code => "AO",
            :name => "Angola",
            :iso3 => "AGO",
            :numeric => 24,
            :eu => false)

    Country.create!(
            :code => "AI",
            :name => "Anguilla",
            :iso3 => "AIA",
            :numeric => 660,
            :eu => false)

    Country.create!(
            :code => "AQ",
            :name => "Antarctica",
            :iso3 => "ATA",
            :numeric => 10,
            :eu => false)

    Country.create!(
            :code => "AG",
            :name => "Antigua and Barbuda",
            :iso3 => "ATG",
            :numeric => 28,
            :eu => false)

    Country.create!(
            :code => "AR",
            :name => "Argentina",
            :iso3 => "ARG",
            :numeric => 32,
            :eu => false)

    Country.create!(
            :code => "AM",
            :name => "Armenia",
            :iso3 => "ARM",
            :numeric => 51,
            :eu => false)

    Country.create!(
            :code => "AW",
            :name => "Aruba",
            :iso3 => "ABW",
            :numeric => 533,
            :eu => false)

    Country.create!(
            :code => "AU",
            :name => "Australia",
            :iso3 => "AUS",
            :numeric => 36,
            :eu => false)

    Country.create!(
            :code => "AT",
            :name => "Austria",
            :iso3 => "AUT",
            :numeric => 40,
            :eu => true)

    Country.create!(
            :code => "AZ",
            :name => "Azerbaijan",
            :iso3 => "AZE",
            :numeric => 31,
            :eu => false)

    Country.create!(
            :code => "BS",
            :name => "Bahamas",
            :iso3 => "BHS",
            :numeric => 44,
            :eu => false)

    Country.create!(
            :code => "BH",
            :name => "Bahrain",
            :iso3 => "BHR",
            :numeric => 48,
            :eu => false)

    Country.create!(
            :code => "BD",
            :name => "Bangladesh",
            :iso3 => "BGD",
            :numeric => 50,
            :eu => false)

    Country.create!(
            :code => "BB",
            :name => "Barbados",
            :iso3 => "BRB",
            :numeric => 52,
            :eu => false)

    Country.create!(
            :code => "BY",
            :name => "Belarus",
            :iso3 => "BLR",
            :numeric => 112,
            :eu => false)

    Country.create!(
            :code => "BE",
            :name => "Belgium",
            :iso3 => "BEL",
            :numeric => 56,
            :eu => true)

    Country.create!(
            :code => "BZ",
            :name => "Belize",
            :iso3 => "BLZ",
            :numeric => 84,
            :eu => false)

    Country.create!(
            :code => "BJ",
            :name => "Benin",
            :iso3 => "BEN",
            :numeric => 204,
            :eu => false)

    Country.create!(
            :code => "BM",
            :name => "Bermuda",
            :iso3 => "BMU",
            :numeric => 60,
            :eu => false)

    Country.create!(
            :code => "BT",
            :name => "Bhutan",
            :iso3 => "BTN",
            :numeric => 64,
            :eu => false)

    Country.create!(
            :code => "BO",
            :name => "Bolivia",
            :iso3 => "BOL",
            :numeric => 68,
            :eu => false)

    Country.create!(
            :code => "BA",
            :name => "Bosnia and Herzegovina",
            :iso3 => "BIH",
            :numeric => 70,
            :eu => false)

    Country.create!(
            :code => "BW",
            :name => "Botswana",
            :iso3 => "BWA",
            :numeric => 72,
            :eu => false)

    Country.create!(
            :code => "BV",
            :name => "Bouvet Island",
            :iso3 => "BVT",
            :numeric => 74,
            :eu => false)

    Country.create!(
            :code => "BR",
            :name => "Brazil",
            :iso3 => "BRA",
            :numeric => 76,
            :eu => false)

    Country.create!(
            :code => "IO",
            :name => "British Indian Ocean Territory",
            :iso3 => "IOT",
            :numeric => 86,
            :eu => false)

    Country.create!(
            :code => "BN",
            :name => "Brunei Darussalam",
            :iso3 => "BRN",
            :numeric => 96,
            :eu => false)

    Country.create!(
            :code => "BG",
            :name => "Bulgaria",
            :iso3 => "BGR",
            :numeric => 100,
            :eu => true)

    Country.create!(
            :code => "BF",
            :name => "Burkina Faso",
            :iso3 => "BFA",
            :numeric => 854,
            :eu => false)

    Country.create!(
            :code => "BI",
            :name => "Burundi",
            :iso3 => "BDI",
            :numeric => 108,
            :eu => false)

    Country.create!(
            :code => "KH",
            :name => "Cambodia",
            :iso3 => "KHM",
            :numeric => 116,
            :eu => false)

    Country.create!(
            :code => "CM",
            :name => "Cameroon",
            :iso3 => "CMR",
            :numeric => 120,
            :eu => false)

    Country.create!(
            :code => "CA",
            :name => "Canada",
            :iso3 => "CAN",
            :numeric => 124,
            :eu => false)

    Country.create!(
            :code => "CV",
            :name => "Cape Verde",
            :iso3 => "CPV",
            :numeric => 132,
            :eu => false)

    Country.create!(
            :code => "KY",
            :name => "Cayman Islands",
            :iso3 => "CYM",
            :numeric => 136,
            :eu => false)

    Country.create!(
            :code => "CF",
            :name => "Central African Republic",
            :iso3 => "CAF",
            :numeric => 140,
            :eu => false)

    Country.create!(
            :code => "TD",
            :name => "Chad",
            :iso3 => "TCD",
            :numeric => 148,
            :eu => false)

    Country.create!(
            :code => "CL",
            :name => "Chile",
            :iso3 => "CHL",
            :numeric => 152,
            :eu => false)

    Country.create!(
            :code => "CN",
            :name => "China",
            :iso3 => "CHN",
            :numeric => 156,
            :eu => false)

    Country.create!(
            :code => "CX",
            :name => "Christmas Island",
            :iso3 => "CXR",
            :numeric => 162,
            :eu => false)

    Country.create!(
            :code => "CC",
            :name => "Cocos (keeling) Islands",
            :iso3 => "CCK",
            :numeric => 166,
            :eu => false)

    Country.create!(
            :code => "CO",
            :name => "Colombia",
            :iso3 => "COL",
            :numeric => 170,
            :eu => false)

    Country.create!(
            :code => "KM",
            :name => "Comoros",
            :iso3 => "COM",
            :numeric => 174,
            :eu => false)

    Country.create!(
            :code => "CG",
            :name => "Congo",
            :iso3 => "COG",
            :numeric => 178,
            :eu => false)

    Country.create!(
            :code => "CD",
            :name => "Congo, The Democratic Republic Of The",
            :iso3 => "COD",
            :numeric => 180,
            :eu => false)

    Country.create!(
            :code => "CK",
            :name => "Cook Islands",
            :iso3 => "COK",
            :numeric => 184,
            :eu => false)

    Country.create!(
            :code => "CR",
            :name => "Costa Rica",
            :iso3 => "CRI",
            :numeric => 188,
            :eu => false)

    Country.create!(
            :code => "HR",
            :name => "Croatia",
            :iso3 => "HRV",
            :numeric => 191,
            :eu => false)

    Country.create!(
            :code => "CU",
            :name => "Cuba",
            :iso3 => "CUB",
            :numeric => 192,
            :eu => false)

    Country.create!(
            :code => "CY",
            :name => "Cyprus",
            :iso3 => "CYP",
            :numeric => 196,
            :eu => true)

    Country.create!(
            :code => "CZ",
            :name => "Czech Republic",
            :iso3 => "CZE",
            :numeric => 203,
            :eu => true)

    Country.create!(
            :code => "CI",
            :name => "Côte D'ivoire",
            :iso3 => "CIV",
            :numeric => 384,
            :eu => false)

    Country.create!(
            :code => "DK",
            :name => "Denmark",
            :iso3 => "DNK",
            :numeric => 208,
            :eu => true)

    Country.create!(
            :code => "DJ",
            :name => "Djibouti",
            :iso3 => "DJI",
            :numeric => 262,
            :eu => false)

    Country.create!(
            :code => "DM",
            :name => "Dominica",
            :iso3 => "DMA",
            :numeric => 212,
            :eu => false)

    Country.create!(
            :code => "DO",
            :name => "Dominican Republic",
            :iso3 => "DOM",
            :numeric => 214,
            :eu => false)

    Country.create!(
            :code => "EC",
            :name => "Ecuador",
            :iso3 => "ECU",
            :numeric => 218,
            :eu => false)

    Country.create!(
            :code => "EG",
            :name => "Egypt",
            :iso3 => "EGY",
            :numeric => 818,
            :eu => false)

    Country.create!(
            :code => "SV",
            :name => "El Salvador",
            :iso3 => "SLV",
            :numeric => 222,
            :eu => false)

    Country.create!(
            :code => "GQ",
            :name => "Equatorial Guinea",
            :iso3 => "GNQ",
            :numeric => 226,
            :eu => false)

    Country.create!(
            :code => "ER",
            :name => "Eritrea",
            :iso3 => "ERI",
            :numeric => 232,
            :eu => false)

    Country.create!(
            :code => "EE",
            :name => "Estonia",
            :iso3 => "EST",
            :numeric => 233,
            :eu => true)

    Country.create!(
            :code => "ET",
            :name => "Ethiopia",
            :iso3 => "ETH",
            :numeric => 231,
            :eu => false)

    Country.create!(
            :code => "FK",
            :name => "Falkland Islands (malvinas)",
            :iso3 => "FLK",
            :numeric => 238,
            :eu => false)

    Country.create!(
            :code => "FO",
            :name => "Faroe Islands",
            :iso3 => "FRO",
            :numeric => 234,
            :eu => false)

    Country.create!(
            :code => "FJ",
            :name => "Fiji",
            :iso3 => "FJI",
            :numeric => 242,
            :eu => false)

    Country.create!(
            :code => "FI",
            :name => "Finland",
            :iso3 => "FIN",
            :numeric => 246,
            :eu => true)

    Country.create!(
            :code => "FR",
            :name => "France",
            :iso3 => "FRA",
            :numeric => 250,
            :eu => true)

    Country.create!(
            :code => "GF",
            :name => "French Guiana",
            :iso3 => "GUF",
            :numeric => 254,
            :eu => false)

    Country.create!(
            :code => "PF",
            :name => "French Polynesia",
            :iso3 => "PYF",
            :numeric => 258,
            :eu => false)

    Country.create!(
            :code => "TF",
            :name => "French Southern Territories",
            :iso3 => "ATF",
            :numeric => 260,
            :eu => false)

    Country.create!(
            :code => "GA",
            :name => "Gabon",
            :iso3 => "GAB",
            :numeric => 266,
            :eu => false)

    Country.create!(
            :code => "GM",
            :name => "Gambia",
            :iso3 => "GMB",
            :numeric => 270,
            :eu => false)

    Country.create!(
            :code => "GE",
            :name => "Georgia",
            :iso3 => "GEO",
            :numeric => 268,
            :eu => false)

    Country.create!(
            :code => "DE",
            :name => "Germany",
            :iso3 => "DEU",
            :numeric => 276,
            :eu => true)

    Country.create!(
            :code => "GH",
            :name => "Ghana",
            :iso3 => "GHA",
            :numeric => 288,
            :eu => false)

    Country.create!(
            :code => "GI",
            :name => "Gibraltar",
            :iso3 => "GIB",
            :numeric => 292,
            :eu => false)

    Country.create!(
            :code => "GR",
            :name => "Greece",
            :iso3 => "GRC",
            :numeric => 300,
            :eu => true)

    Country.create!(
            :code => "GL",
            :name => "Greenland",
            :iso3 => "GRL",
            :numeric => 304,
            :eu => false)

    Country.create!(
            :code => "GD",
            :name => "Grenada",
            :iso3 => "GRD",
            :numeric => 308,
            :eu => false)

    Country.create!(
            :code => "GP",
            :name => "Guadeloupe",
            :iso3 => "GLP",
            :numeric => 312,
            :eu => false)

    Country.create!(
            :code => "GU",
            :name => "Guam",
            :iso3 => "GUM",
            :numeric => 316,
            :eu => false)

    Country.create!(
            :code => "GT",
            :name => "Guatemala",
            :iso3 => "GTM",
            :numeric => 320,
            :eu => false)

    Country.create!(
            :code => "GG",
            :name => "Guernsey",
            :iso3 => "GGY",
            :numeric => 831,
            :eu => false)

    Country.create!(
            :code => "GN",
            :name => "Guinea",
            :iso3 => "GIN",
            :numeric => 324,
            :eu => false)

    Country.create!(
            :code => "GW",
            :name => "Guinea-bissau",
            :iso3 => "GNB",
            :numeric => 624,
            :eu => false)

    Country.create!(
            :code => "GY",
            :name => "Guyana",
            :iso3 => "GUY",
            :numeric => 328,
            :eu => false)

    Country.create!(
            :code => "HT",
            :name => "Haiti",
            :iso3 => "HTI",
            :numeric => 332,
            :eu => false)

    Country.create!(
            :code => "HM",
            :name => "Heard Island and Mcdonald Islands",
            :iso3 => "HMD",
            :numeric => 334,
            :eu => false)

    Country.create!(
            :code => "HN",
            :name => "Honduras",
            :iso3 => "HND",
            :numeric => 340,
            :eu => false)

    Country.create!(
            :code => "HK",
            :name => "Hong Kong",
            :iso3 => "HKG",
            :numeric => 344,
            :eu => false)

    Country.create!(
            :code => "HU",
            :name => "Hungary",
            :iso3 => "HUN",
            :numeric => 348,
            :eu => true)

    Country.create!(
            :code => "IS",
            :name => "Iceland",
            :iso3 => "ISL",
            :numeric => 352,
            :eu => false)

    Country.create!(
            :code => "IN",
            :name => "India",
            :iso3 => "IND",
            :numeric => 356,
            :eu => false)

    Country.create!(
            :code => "ID",
            :name => "Indonesia",
            :iso3 => "IDN",
            :numeric => 360,
            :eu => false)

    Country.create!(
            :code => "IR",
            :name => "Iran, Islamic Republic Of",
            :iso3 => "IRN",
            :numeric => 364,
            :eu => false)

    Country.create!(
            :code => "IQ",
            :name => "Iraq",
            :iso3 => "IRQ",
            :numeric => 368,
            :eu => false)

    Country.create!(
            :code => "IE",
            :name => "Ireland",
            :iso3 => "IRL",
            :numeric => 372,
            :eu => true)

    Country.create!(
            :code => "IM",
            :name => "Isle Of Man",
            :iso3 => "IMN",
            :numeric => 833,
            :eu => false)

    Country.create!(
            :code => "IL",
            :name => "Israel",
            :iso3 => "ISR",
            :numeric => 376,
            :eu => false)

    Country.create!(
            :code => "IT",
            :name => "Italy",
            :iso3 => "ITA",
            :numeric => 380,
            :eu => true)

    Country.create!(
            :code => "JM",
            :name => "Jamaica",
            :iso3 => "JAM",
            :numeric => 388,
            :eu => false)

    Country.create!(
            :code => "JP",
            :name => "Japan",
            :iso3 => "JPN",
            :numeric => 392,
            :eu => false)

    Country.create!(
            :code => "JE",
            :name => "Jersey",
            :iso3 => "JEY",
            :numeric => 832,
            :eu => false)

    Country.create!(
            :code => "JO",
            :name => "Jordan",
            :iso3 => "JOR",
            :numeric => 400,
            :eu => false)

    Country.create!(
            :code => "KZ",
            :name => "Kazakhstan",
            :iso3 => "KAZ",
            :numeric => 398,
            :eu => false)

    Country.create!(
            :code => "KE",
            :name => "Kenya",
            :iso3 => "KEN",
            :numeric => 404,
            :eu => false)

    Country.create!(
            :code => "KI",
            :name => "Kiribati",
            :iso3 => "KIR",
            :numeric => 296,
            :eu => false)

    Country.create!(
            :code => "KP",
            :name => "Korea, Democratic People's Republic Of",
            :iso3 => "PRK",
            :numeric => 408,
            :eu => false)

    Country.create!(
            :code => "KR",
            :name => "Korea, Republic Of",
            :iso3 => "KOR",
            :numeric => 410,
            :eu => false)

    Country.create!(
            :code => "KW",
            :name => "Kuwait",
            :iso3 => "KWT",
            :numeric => 414,
            :eu => false)

    Country.create!(
            :code => "KG",
            :name => "Kyrgyzstan",
            :iso3 => "KGZ",
            :numeric => 417,
            :eu => false)

    Country.create!(
            :code => "LA",
            :name => "Lao People's Democratic Republic",
            :iso3 => "LAO",
            :numeric => 418,
            :eu => false)

    Country.create!(
            :code => "LV",
            :name => "Latvia",
            :iso3 => "LVA",
            :numeric => 428,
            :eu => true)

    Country.create!(
            :code => "LB",
            :name => "Lebanon",
            :iso3 => "LBN",
            :numeric => 422,
            :eu => false)

    Country.create!(
            :code => "LS",
            :name => "Lesotho",
            :iso3 => "LSO",
            :numeric => 426,
            :eu => false)

    Country.create!(
            :code => "LR",
            :name => "Liberia",
            :iso3 => "LBR",
            :numeric => 430,
            :eu => false)

    Country.create!(
            :code => "LY",
            :name => "Libyan Arab Jamahiriya",
            :iso3 => "LBY",
            :numeric => 434,
            :eu => false)

    Country.create!(
            :code => "LI",
            :name => "Liechtenstein",
            :iso3 => "LIE",
            :numeric => 438,
            :eu => false)

    Country.create!(
            :code => "LT",
            :name => "Lithuania",
            :iso3 => "LTU",
            :numeric => 440,
            :eu => true)

    Country.create!(
            :code => "LU",
            :name => "Luxembourg",
            :iso3 => "LUX",
            :numeric => 442,
            :eu => true)

    Country.create!(
            :code => "MO",
            :name => "Macao",
            :iso3 => "MAC",
            :numeric => 446,
            :eu => false)

    Country.create!(
            :code => "MK",
            :name => "Macedonia, The Former Yugoslav Republic Of",
            :iso3 => "MKD",
            :numeric => 807,
            :eu => false)

    Country.create!(
            :code => "MG",
            :name => "Madagascar",
            :iso3 => "MDG",
            :numeric => 450,
            :eu => false)

    Country.create!(
            :code => "MW",
            :name => "Malawi",
            :iso3 => "MWI",
            :numeric => 454,
            :eu => false)

    Country.create!(
            :code => "MY",
            :name => "Malaysia",
            :iso3 => "MYS",
            :numeric => 458,
            :eu => false)

    Country.create!(
            :code => "MV",
            :name => "Maldives",
            :iso3 => "MDV",
            :numeric => 462,
            :eu => false)

    Country.create!(
            :code => "ML",
            :name => "Mali",
            :iso3 => "MLI",
            :numeric => 466,
            :eu => false)

    Country.create!(
            :code => "MT",
            :name => "Malta",
            :iso3 => "MLT",
            :numeric => 470,
            :eu => true)

    Country.create!(
            :code => "MH",
            :name => "Marshall Islands",
            :iso3 => "MHL",
            :numeric => 584,
            :eu => false)

    Country.create!(
            :code => "MQ",
            :name => "Martinique",
            :iso3 => "MTQ",
            :numeric => 474,
            :eu => false)

    Country.create!(
            :code => "MR",
            :name => "Mauritania",
            :iso3 => "MRT",
            :numeric => 478,
            :eu => false)

    Country.create!(
            :code => "MU",
            :name => "Mauritius",
            :iso3 => "MUS",
            :numeric => 480,
            :eu => false)

    Country.create!(
            :code => "YT",
            :name => "Mayotte",
            :iso3 => "MYT",
            :numeric => 175,
            :eu => false)

    Country.create!(
            :code => "MX",
            :name => "Mexico",
            :iso3 => "MEX",
            :numeric => 484,
            :eu => false)

    Country.create!(
            :code => "FM",
            :name => "Micronesia, Federated States Of",
            :iso3 => "FSM",
            :numeric => 583,
            :eu => false)

    Country.create!(
            :code => "MD",
            :name => "Moldova, Republic Of",
            :iso3 => "MDA",
            :numeric => 498,
            :eu => false)

    Country.create!(
            :code => "MC",
            :name => "Monaco",
            :iso3 => "MCO",
            :numeric => 492,
            :eu => false)

    Country.create!(
            :code => "MN",
            :name => "Mongolia",
            :iso3 => "MNG",
            :numeric => 496,
            :eu => false)

    Country.create!(
            :code => "ME",
            :name => "Montenegro",
            :iso3 => "MNE",
            :numeric => 499,
            :eu => false)

    Country.create!(
            :code => "MS",
            :name => "Montserrat",
            :iso3 => "MSR",
            :numeric => 500,
            :eu => false)

    Country.create!(
            :code => "MA",
            :name => "Morocco",
            :iso3 => "MAR",
            :numeric => 504,
            :eu => false)

    Country.create!(
            :code => "MZ",
            :name => "Mozambique",
            :iso3 => "MOZ",
            :numeric => 508,
            :eu => false)

    Country.create!(
            :code => "MM",
            :name => "Myanmar",
            :iso3 => "MMR",
            :numeric => 104,
            :eu => false)

    Country.create!(
            :code => "NA",
            :name => "Namibia",
            :iso3 => "NAM",
            :numeric => 516,
            :eu => false)

    Country.create!(
            :code => "NR",
            :name => "Nauru",
            :iso3 => "NRU",
            :numeric => 520,
            :eu => false)

    Country.create!(
            :code => "NP",
            :name => "Nepal",
            :iso3 => "NPL",
            :numeric => 524,
            :eu => false)

    Country.create!(
            :code => "NL",
            :name => "Netherlands",
            :iso3 => "NLD",
            :numeric => 528,
            :eu => true)

    Country.create!(
            :code => "AN",
            :name => "Netherlands Antilles",
            :iso3 => "ANT",
            :numeric => 530,
            :eu => false)

    Country.create!(
            :code => "NC",
            :name => "New Caledonia",
            :iso3 => "NCL",
            :numeric => 540,
            :eu => false)

    Country.create!(
            :code => "NZ",
            :name => "New Zealand",
            :iso3 => "NZL",
            :numeric => 554,
            :eu => false)

    Country.create!(
            :code => "NI",
            :name => "Nicaragua",
            :iso3 => "NIC",
            :numeric => 558,
            :eu => false)

    Country.create!(
            :code => "NE",
            :name => "Niger",
            :iso3 => "NER",
            :numeric => 562,
            :eu => false)

    Country.create!(
            :code => "NG",
            :name => "Nigeria",
            :iso3 => "NGA",
            :numeric => 566,
            :eu => false)

    Country.create!(
            :code => "NU",
            :name => "Niue",
            :iso3 => "NIU",
            :numeric => 570,
            :eu => false)

    Country.create!(
            :code => "NF",
            :name => "Norfolk Island",
            :iso3 => "NFK",
            :numeric => 574,
            :eu => false)

    Country.create!(
            :code => "MP",
            :name => "Northern Mariana Islands",
            :iso3 => "MNP",
            :numeric => 580,
            :eu => false)

    Country.create!(
            :code => "NO",
            :name => "Norway",
            :iso3 => "NOR",
            :numeric => 578,
            :eu => false)

    Country.create!(
            :code => "OM",
            :name => "Oman",
            :iso3 => "OMN",
            :numeric => 512,
            :eu => false)

    Country.create!(
            :code => "PK",
            :name => "Pakistan",
            :iso3 => "PAK",
            :numeric => 586,
            :eu => false)

    Country.create!(
            :code => "PW",
            :name => "Palau",
            :iso3 => "PLW",
            :numeric => 585,
            :eu => false)

    Country.create!(
            :code => "PS",
            :name => "Palestinian Territory, Occupied",
            :iso3 => "PSE",
            :numeric => 275,
            :eu => false)

    Country.create!(
            :code => "PA",
            :name => "Panama",
            :iso3 => "PAN",
            :numeric => 591,
            :eu => false)

    Country.create!(
            :code => "PG",
            :name => "Papua New Guinea",
            :iso3 => "PNG",
            :numeric => 598,
            :eu => false)

    Country.create!(
            :code => "PY",
            :name => "Paraguay",
            :iso3 => "PRY",
            :numeric => 600,
            :eu => false)

    Country.create!(
            :code => "PE",
            :name => "Peru",
            :iso3 => "PER",
            :numeric => 604,
            :eu => false)

    Country.create!(
            :code => "PH",
            :name => "Philippines",
            :iso3 => "PHL",
            :numeric => 608,
            :eu => false)

    Country.create!(
            :code => "PN",
            :name => "Pitcairn",
            :iso3 => "PCN",
            :numeric => 612,
            :eu => false)

    Country.create!(
            :code => "PL",
            :name => "Poland",
            :iso3 => "POL",
            :numeric => 616,
            :eu => true)

    Country.create!(
            :code => "PT",
            :name => "Portugal",
            :iso3 => "PRT",
            :numeric => 620,
            :eu => true)

    Country.create!(
            :code => "PR",
            :name => "Puerto Rico",
            :iso3 => "PRI",
            :numeric => 630,
            :eu => false)

    Country.create!(
            :code => "QA",
            :name => "Qatar",
            :iso3 => "QAT",
            :numeric => 634,
            :eu => false)

    Country.create!(
            :code => "RO",
            :name => "Romania",
            :iso3 => "ROU",
            :numeric => 642,
            :eu => true)

    Country.create!(
            :code => "RU",
            :name => "Russian Federation",
            :iso3 => "RUS",
            :numeric => 643,
            :eu => false)

    Country.create!(
            :code => "RW",
            :name => "Rwanda",
            :iso3 => "RWA",
            :numeric => 646,
            :eu => false)

    Country.create!(
            :code => "RE",
            :name => "Réunion",
            :iso3 => "REU",
            :numeric => 638,
            :eu => false)

    Country.create!(
            :code => "BL",
            :name => "Saint Barthélemy",
            :iso3 => "BLM",
            :numeric => 652,
            :eu => false)

    Country.create!(
            :code => "SH",
            :name => "Saint Helena",
            :iso3 => "SHN",
            :numeric => 654,
            :eu => false)

    Country.create!(
            :code => "KN",
            :name => "Saint Kitts and Nevis",
            :iso3 => "KNA",
            :numeric => 659,
            :eu => false)

    Country.create!(
            :code => "LC",
            :name => "Saint Lucia",
            :iso3 => "LCA",
            :numeric => 662,
            :eu => false)

    Country.create!(
            :code => "MF",
            :name => "Saint Martin",
            :iso3 => "MAF",
            :numeric => 663,
            :eu => false)

    Country.create!(
            :code => "PM",
            :name => "Saint Pierre and Miquelon",
            :iso3 => "SPM",
            :numeric => 666,
            :eu => false)

    Country.create!(
            :code => "VC",
            :name => "Saint Vincent and The Grenadines",
            :iso3 => "VCT",
            :numeric => 670,
            :eu => false)

    Country.create!(
            :code => "WS",
            :name => "Samoa",
            :iso3 => "WSM",
            :numeric => 882,
            :eu => false)

    Country.create!(
            :code => "SM",
            :name => "San Marino",
            :iso3 => "SMR",
            :numeric => 674,
            :eu => false)

    Country.create!(
            :code => "ST",
            :name => "Sao Tome and Principe",
            :iso3 => "STP",
            :numeric => 678,
            :eu => false)

    Country.create!(
            :code => "SA",
            :name => "Saudi Arabia",
            :iso3 => "SAU",
            :numeric => 682,
            :eu => false)

    Country.create!(
            :code => "SN",
            :name => "Senegal",
            :iso3 => "SEN",
            :numeric => 686,
            :eu => false)

    Country.create!(
            :code => "RS",
            :name => "Serbia",
            :iso3 => "SRB",
            :numeric => 688,
            :eu => false)

    Country.create!(
            :code => "SC",
            :name => "Seychelles",
            :iso3 => "SYC",
            :numeric => 690,
            :eu => false)

    Country.create!(
            :code => "SL",
            :name => "Sierra Leone",
            :iso3 => "SLE",
            :numeric => 694,
            :eu => false)

    Country.create!(
            :code => "SG",
            :name => "Singapore",
            :iso3 => "SGP",
            :numeric => 702,
            :eu => false)

    Country.create!(
            :code => "SK",
            :name => "Slovakia",
            :iso3 => "SVK",
            :numeric => 703,
            :eu => true)

    Country.create!(
            :code => "SI",
            :name => "Slovenia",
            :iso3 => "SVN",
            :numeric => 705,
            :eu => true)

    Country.create!(
            :code => "SB",
            :name => "Solomon Islands",
            :iso3 => "SLB",
            :numeric => 90,
            :eu => false)

    Country.create!(
            :code => "SO",
            :name => "Somalia",
            :iso3 => "SOM",
            :numeric => 706,
            :eu => false)

    Country.create!(
            :code => "ZA",
            :name => "South Africa",
            :iso3 => "ZAF",
            :numeric => 710,
            :eu => false)

    Country.create!(
            :code => "GS",
            :name => "South Georgia and The South Sandwich Islands",
            :iso3 => "SGS",
            :numeric => 239,
            :eu => false)

    Country.create!(
            :code => "ES",
            :name => "Spain",
            :iso3 => "ESP",
            :numeric => 724,
            :eu => true)

    Country.create!(
            :code => "LK",
            :name => "Sri Lanka",
            :iso3 => "LKA",
            :numeric => 144,
            :eu => false)

    Country.create!(
            :code => "SD",
            :name => "Sudan",
            :iso3 => "SDN",
            :numeric => 736,
            :eu => false)

    Country.create!(
            :code => "SR",
            :name => "Suriname",
            :iso3 => "SUR",
            :numeric => 740,
            :eu => false)

    Country.create!(
            :code => "SJ",
            :name => "Svalbard and Jan Mayen",
            :iso3 => "SJM",
            :numeric => 744,
            :eu => false)

    Country.create!(
            :code => "SZ",
            :name => "Swaziland",
            :iso3 => "SWZ",
            :numeric => 748,
            :eu => false)

    Country.create!(
            :code => "SE",
            :name => "Sweden",
            :iso3 => "SWE",
            :numeric => 752,
            :eu => true)

    Country.create!(
            :code => "CH",
            :name => "Switzerland",
            :iso3 => "CHE",
            :numeric => 756,
            :eu => false)

    Country.create!(
            :code => "SY",
            :name => "Syrian Arab Republic",
            :iso3 => "SYR",
            :numeric => 760,
            :eu => false)

    Country.create!(
            :code => "TW",
            :name => "Taiwan, Province Of China",
            :iso3 => "TWN",
            :numeric => 158,
            :eu => false)

    Country.create!(
            :code => "TJ",
            :name => "Tajikistan",
            :iso3 => "TJK",
            :numeric => 762,
            :eu => false)

    Country.create!(
            :code => "TZ",
            :name => "Tanzania, United Republic Of",
            :iso3 => "TZA",
            :numeric => 834,
            :eu => false)

    Country.create!(
            :code => "TH",
            :name => "Thailand",
            :iso3 => "THA",
            :numeric => 764,
            :eu => false)

    Country.create!(
            :code => "TL",
            :name => "Timor-leste",
            :iso3 => "TLS",
            :numeric => 626,
            :eu => false)

    Country.create!(
            :code => "TG",
            :name => "Togo",
            :iso3 => "TGO",
            :numeric => 768,
            :eu => false)

    Country.create!(
            :code => "TK",
            :name => "Tokelau",
            :iso3 => "TKL",
            :numeric => 772,
            :eu => false)

    Country.create!(
            :code => "TO",
            :name => "Tonga",
            :iso3 => "TON",
            :numeric => 776,
            :eu => false)

    Country.create!(
            :code => "TT",
            :name => "Trinidad and Tobago",
            :iso3 => "TTO",
            :numeric => 780,
            :eu => false)

    Country.create!(
            :code => "TN",
            :name => "Tunisia",
            :iso3 => "TUN",
            :numeric => 788,
            :eu => false)

    Country.create!(
            :code => "TR",
            :name => "Turkey",
            :iso3 => "TUR",
            :numeric => 792,
            :eu => false)

    Country.create!(
            :code => "TM",
            :name => "Turkmenistan",
            :iso3 => "TKM",
            :numeric => 795,
            :eu => false)

    Country.create!(
            :code => "TC",
            :name => "Turks and Caicos Islands",
            :iso3 => "TCA",
            :numeric => 796,
            :eu => false)

    Country.create!(
            :code => "TV",
            :name => "Tuvalu",
            :iso3 => "TUV",
            :numeric => 798,
            :eu => false)

    Country.create!(
            :code => "UG",
            :name => "Uganda",
            :iso3 => "UGA",
            :numeric => 800,
            :eu => false)

    Country.create!(
            :code => "UA",
            :name => "Ukraine",
            :iso3 => "UKR",
            :numeric => 804,
            :eu => false)

    Country.create!(
            :code => "AE",
            :name => "United Arab Emirates",
            :iso3 => "ARE",
            :numeric => 784,
            :eu => false)

    Country.create!(
            :code => "GB",
            :name => "United Kingdom",
            :iso3 => "GBR",
            :numeric => 826,
            :eu => true)

    Country.create!(
            :code => "US",
            :name => "United States",
            :iso3 => "USA",
            :numeric => 840,
            :eu => false)

    Country.create!(
            :code => "UM",
            :name => "United States Minor Outlying Islands",
            :iso3 => "UMI",
            :numeric => 581,
            :eu => false)

    Country.create!(
            :code => "UY",
            :name => "Uruguay",
            :iso3 => "URY",
            :numeric => 858,
            :eu => false)

    Country.create!(
            :code => "UZ",
            :name => "Uzbekistan",
            :iso3 => "UZB",
            :numeric => 860,
            :eu => false)

    Country.create!(
            :code => "VU",
            :name => "Vanuatu",
            :iso3 => "VUT",
            :numeric => 548,
            :eu => false)

    Country.create!(
            :code => "VA",
            :name => "Vatican City State",
            :iso3 => "VAT",
            :numeric => 336,
            :eu => false)

    Country.create!(
            :code => "VE",
            :name => "Venezuela, Bolivarian Republic Of",
            :iso3 => "VEN",
            :numeric => 862,
            :eu => false)

    Country.create!(
            :code => "VN",
            :name => "Vietnam",
            :iso3 => "VNM",
            :numeric => 704,
            :eu => false)

    Country.create!(
            :code => "VG",
            :name => "Virgin Islands, British",
            :iso3 => "VGB",
            :numeric => 92,
            :eu => false)

    Country.create!(
            :code => "VI",
            :name => "Virgin Islands, U.s.",
            :iso3 => "VIR",
            :numeric => 850,
            :eu => false)

    Country.create!(
            :code => "WF",
            :name => "Wallis and Futuna",
            :iso3 => "WLF",
            :numeric => 876,
            :eu => false)

    Country.create!(
            :code => "EH",
            :name => "Western Sahara",
            :iso3 => "ESH",
            :numeric => 732,
            :eu => false)

    Country.create!(
            :code => "YE",
            :name => "Yemen",
            :iso3 => "YEM",
            :numeric => 887,
            :eu => false)

    Country.create!(
            :code => "ZM",
            :name => "Zambia",
            :iso3 => "ZMB",
            :numeric => 894,
            :eu => false)

    Country.create!(
            :code => "ZW",
            :name => "Zimbabwe",
            :iso3 => "ZWE",
            :numeric => 716,
            :eu => false)

    Country.create!(
            :code => "AX",
            :name => "Åland Islands",
            :iso3 => "ALA",
            :numeric => 248,
            :eu => false)
  end

  def self.down
    drop_table :countries
  end
end