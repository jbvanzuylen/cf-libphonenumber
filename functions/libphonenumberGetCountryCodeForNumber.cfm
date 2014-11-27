<cffunction name="libphonenumberGetCountryCodeForNumber" returntype="string" output="false">
  <cfargument name="number" type="libphonenumber.PhoneNumber" required="true" />

  <!--- Get the country code of the given phone number --->
  <cfreturn arguments.number.getCountryCodeForNumber() />
</cffunction>