<cffunction name="libphonenumberGetCountryCodeForRegion" returntype="numeric" output="false">
  <cfargument name="regionCode" type="string" required="true" />

  <!--- Generate an example phone number for the given region --->
  <cfreturn createObject("component", "libphonenumber.PhoneNumber").getCountryCodeForRegion(arguments.regionCode) />
</cffunction>