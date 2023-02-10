<resource schema="xrtspec">
  <meta name="title">SWIFT XRT</meta>
  <meta name="creationDate">2018-02-01T01:02:03</meta>
  <meta name="description">
      The SWIFT XRT data spectrum.
  </meta>
  <meta name="creator.name">Paolo Giommi et al. 2021</meta>

  <meta name="subject">Catalogs</meta>
  <meta name="subject">X-ray sources</meta>

  <meta name="coverage">
    <meta name="profile">AllSky ICRS</meta>
    <meta name="waveband">X-ray</meta>
  </meta>

  <meta name="source">
    2021, MNRAS, 507, 5690
  </meta>

  <table id="main" onDisk="True" mixin="//scs#q3cindex" primary="Source_id">
    <index columns="RA,Dec"/>

    <column name="Source_id" type="text"
        ucd="meta.id;meta.main"
        tablehead="Source id" verbLevel="1"
        description="Object ID"
        required="True"/>

    <column name="RA" type="double precision"
      unit="deg" ucd="pos.eq.ra;meta.main"
      tablehead="RA" verbLevel="1"
      description="Right ascension (J2000) of the object"
      required="True"/>

    <column name="Dec" type="double precision"
      unit="deg" ucd="pos.eq.dec;meta.main"
      tablehead="Dec" verbLevel="1"
      description="Declination (J2000) of the object"
      required="True"/>

    <column name="Frequency" type="real"
      unit="Hz" ucd="em.freq"
      tablehead="Frequency" verbLevel="1"
      description="Frequency"
      required="True"/>

    <column name="Frequency_err" type="real"
      unit="Hz" ucd="stat.error;em.freq"
      tablehead="Frequency_err" verbLevel="1"
      description="Frequency error"
      required="True"/>

    <column name="Flux" type="real"
      unit="erg sec-1 cm-2" ucd="phot.flux.density;em.X-ray"
      tablehead="Flux" verbLevel="1"
      description="Flux"
      required="True"/>

    <column name="Flux_err" type="real"
      unit="erg sec-1 cm-2" ucd="stat.error;phot.flux.density;em.X-ray"
      tablehead="Flux_err" verbLevel="1"
      description="Flux error"
      required="True"/>

    <column name="Start_time" type="double precision"
      unit="MJD" ucd="time.start"
      tablehead="Start_time" verbLevel="1"
      description="observation start time"
      required="True"/>

    <column name="End_time" type="double precision"
      unit="MJD" ucd="time.end"
      tablehead="End_time" verbLevel="1"
      description="observation end time"
      required="True"/>


  </table>

  <data id="import">
    <sources>xrtspec2.fits</sources>

    <fitsTableGrammar/>

    <make table="main">
      <rowmaker idmaps="*"/>
    </make>
  </data>

  <service id="cone" allowed="scs.xml,form">
    <meta name="title">XRT Spectral Data</meta>
    <meta name="shortName">xrtspec cone</meta>
    <meta name="testQuery">
      <meta name="ra">20.02637</meta>
      <meta name="dec">21.98903</meta>
      <meta name="sr">1.0</meta>
    </meta>

    <dbCore queriedTable="main">
      <FEED source="//scs#coreDescs"/>
    </dbCore>

    <!--publish render="scs.xml" sets="ivo_managed"/-->
    <publish render="form" sets="local"/>
    <outputTable verbLevel="20"/>
  </service>

</resource>
