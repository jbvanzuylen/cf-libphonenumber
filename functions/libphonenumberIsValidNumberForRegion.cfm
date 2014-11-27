<cffunction name="libphonenumberIsValidNumberForRegion" returntype="boolean" output="false">
  <cfargument name="number" type="libphonenumber.PhoneNumber" required="true" />
  <cfargument name="regionCode" type="string" required="true" />

  <!--- Check the validity of the given phone number for the given region --->
  <cfreturn arguments.number.isValidNumberForRegion(arguments.regionCode) />
</cffunction>