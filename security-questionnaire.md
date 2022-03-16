## Self-Review Questionnaire: Security and Privacy

#### What information might this feature expose to Web sites or other parties, and for what purposes is that exposure necessary?

The `Sec-Fetch-COEP` header exposes the COEP of the environment a resource will
be rendered in. This allows a server to decline answering a request if they do
not want their resource to be embedded in a more dangerous environment. The
`window.anonymous` method exposes whether a document is loaded in an anonymous
iframe or not, allowing a document to change its behavior depending on the
availability of existing credentials or stored resources.

#### Do features in your specification expose the minimum amount of information necessary to enable their intended uses?

Yes. The only thing exposed is whether a frame is anonymous or not.

#### How do the features in your specification deal with personal information, personally-identifiable information (PII), or information derived from them?

The feature does not deal with PII.

#### How do the features in your specification deal with sensitive information?

The feature does not deal with sensitive information.

#### Do the features in your specification introduce new state for an origin that persists across browsing sessions?

No the feature does not introduce new state for an origin.

#### Do the features in your specification expose information about the underlying platform to origins?

No the feature behaves the same regardless of the underlying platform.

#### Does this specification allow an origin to send data to the underlying platform?

No this feature does not change what data an origin is allowed to send to the underlying platform.

#### Do features in this specification allow an origin access to sensors on a user’s device?

No the feature has no impacty on sensor access.

#### What data do the features in this specification expose to an origin? Please also document what data is identical to data exposed by other features, in the same or different contexts.

The `Sec-Fetch-COEP` header exposes the COEP of the environment a resource will
be rendered in. This corresponds to the COEP of the embedder of the resource, or
the fact that a resource is loading in an anonymous iframe. This allows a server
to decline answering a request if they do not want their resource to be embedded
in a more dangerous environment.

#### Do features in this specification enable new script execution/loading mechanisms?

No the feature does not enable new script execution/loading.

#### Do features in this specification allow an origin to access other devices?

No the feature is strictly confined to one device.

#### Do features in this specification allow an origin some measure of control over a user agent’s native UI?

No the feature has no impact on UI.

#### What temporary identifiers do the feautures in this specification create or expose to the web?

No temporary identifiers are created.

#### How does this specification distinguish between behavior in first-party and third-party contexts?

There is no distinction between first-party and third-party ability to embed
anonymous iframes. This is due to the recursive nature of COEP. To deploy COEP
in a frame, all child frames need to deploy COEP first. Since this is a
mechanism to help with the deployment of COEP, we want to offer third-party
iframes the option to ease their own COEP deployment by being able to embed
their own third party content as anonymous iframes.

#### How do the features in this specification work in the context of a browser’s Private Browsing or Incognito mode?

No difference with regular mode.

#### Does this specification have both "Security Considerations" and "Privacy Considerations" sections?

Yes.

#### Do features in your specification enable origins to downgrade default security protections?

This feature has no impact on secure context and same-origin policy. It does
allow to use features which are right now gated behind having COOP and COEP
enabled. However, it imposes restrictions on documents to make this safe.
