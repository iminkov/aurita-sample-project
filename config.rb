
require('aurita/model')
require('aurita/base/configuration')
require('lore/cache/memcache_entity_cache')


class Aurita::Project_Configuration < Aurita::Configuration

  project_name :cdstex_admin

  host 'http://cdstex.dynamistics.com'
  app_path '/aurita/'
  title 'CDS-TEX'
  namespace 'CDStex'

  domains [ 'cds-tex.de', 'www.cds-tex.de', 
            'sweatshirt-besticken.de', 'www.sweatshirt-besticken.de', 
            'vereinskleidung-besticken.de', 'www.vereinskleidung-besticken.de', 
            'vereinskleidung-bedrucken.de', 'www.vereinskleidung-bedrucken.de', 
            'sportkleidung-bedrucken.de', 'www.sportkleidung-bedrucken.de', 
            'sportkleidung-besticken.de', 'www.sportkleidung-besticken.de', 
            'dienstkleidung-besticken.de', 'www.dienstkleidung-besticken.de', 
            'dienstkleidung-bedrucken.de', 'www.dienstkleidung-bedrucken.de', 
            'firmenkleidung-besticken.de', 'www.firmenkleisung-besticken.de', 
            'firmenkleidung-bedrucken.de', 'www.firmenkleidung-bedrucken.de' ]

  default_theme { 'default' }
  default_language :de

  db_cache Lore::Cache::Memcache_Entity_Cache

  databases(:production  => { 'cdstex' => [ 'aurita', 'aurita23' ] }, 
            :test        => { 'cdstex' => [ 'aurita', 'aurita23' ] }, 
            :development => { 'cdstex' => [ 'aurita', 'aurita23' ] }) 

  cluster_ports(:production  => [ 3007, 3008 ],
                :test        => [ 3050 ], 
                :development => [ 3060 ])

  stats_excluded_domain 'cds-tex.de'

end

