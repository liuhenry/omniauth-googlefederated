# OmniAuth Google Federated (Hybrid OpenID+OAuth) #

Hybrid authentication and authorization strategy for Google APIs. Combines the process for obtaining an authorized OAuth request token along with an OpenID authentication request. From the [Google API Docs](http://code.google.com/apis/accounts/docs/OpenID.html) 

> The goal of OAuth is to acquire an access token from Google, which can then be used to exchange user-specific data with a Google service (such as calendar information or an address book). The regular OAuth process is a four-step sequence: (1) ask for a "request" token, (2) ask for the token to be authorized, which triggers user approval, (3) exchange the authorized request token for an "access" token, and (4) use the access token to interact with the user's Google service data. For a more detailed description, see OAuth for Web Applications.
> With OpenID+OAuth, this sequence remains essentially the same. The difference is that getting an authorized OAuth request token (steps 1 and 2) is wrapped up in the OpenID authentication request. In this way, the user can approve login and service access at the same time.

