#!/opt/puppetlabs/puppet/bin/ruby

@environment = {
		 "prd" => "production",
		 "stg" => "staging",
		 "dev" => "development",
		 "qa" => "qa"
	       }

@parameter_data = {
	      "fra" => {
			"location" => "frankfurt_dc"
		       },
	      "ham" => {
			"location" => "hamburg_dc"
		       },
	      "muc" => {
			"location" => "munich_dc"
		       }
	          }

@role = {
	    "prd" => {
		     "web" => "prd_web_server",
		     "dbs" => "prd_db_server"
		   },
	    "stg" => {
		     "web" => "stg_web_server",
		     "dbs" => "stg_db_server"
		   },
	    "dev" => {
		     "web" => "dev_web_server",
		     "dbs" => "dev_db_server"
		   }
	}

@module_definitions = {
    "base" => [
	  'hostconfig',
            ],

    "prd_servers" => [
    	  '@base',
	  'prd_data',
    	],

    "stg_servers" => [
    	  '@base',
	  'stg_data',
    	],

    "dev_servers" => [
    	  '@base',
	  'dev_data',
    	],

    "prd_web_server" => [
    	  '@prd_servers',
    	  'apache'
    	],

    "prd_db_server" => [
    	  '@prd_servers',
    	  'mysql'
    	],

    "stg_web_server" => [
    	  '@stg_servers',
    	  'apache'
    	],

    "stg_db_server" => [
    	  '@stg_servers',
    	  'mysql'
    	],

    "dev_web_server" => [
    	  '@dev_servers',
    	  'apache'
    	],

    "dev_db_server" => [
    	  '@dev_servers',
    	  'mysql'
    	],

}
