<cffunction name="libphonenumberGetRegionCodeForNumber" returntype="string" output="false">
  <cfargument name="number" type="libphonenumber.PhoneNumber" required="true" />

  <!--- Get the region code of the given phone number --->
  <cfreturn arguments.number.getRegionCodeForNumber() />
</cffunction>