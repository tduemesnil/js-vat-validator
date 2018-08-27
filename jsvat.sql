--
-- File: .\jsvat.sql
-- Created Date: 2018-08-20  15:25
-- Author: Thomas Duemesnil
-- -----
-- Last Modified: 2018-08-27 08:51
-- Modified By: Thomas Duemesnil
--

-- Install the Javascript File as External Object in SQL Anywhere.
-- You need to have READ CLIENT FILE system privilege to use this.   
-- and READ_CLIENT_FILE feature must be enabled for the server !

-- Relative Path works only when called from update script !
create variable theScript long varchar;
set theScript = read_client_file('.\\jsvat.js');

BEGIN TRY
remove EXTERNAL object 'jsvat';
END TRY
BEGIN CATCH
END CATCH;

INSTALL EXTERNAL OBJECT 'jsvat'
  NEW
  FROM VALUE theScript
ENVIRONMENT JS;

drop variable theScript;

CREATE OR REPLACE FUNCTION "validVatNumber"(CountryA2 char(2), VatNo varchar(80))
RETURNS varchar(80)
EXTERNAL NAME '<S><file=jsvat> checkVATNumber(SS)'
LANGUAGE JS;

grant execute on "validVatNumber" to dba;