# WarpDrive submission for IAM-Z and Zeus

Peace of mind in the age of web 3.0

- https://twitter.com/2bonahill
- iamz.network (main website - under construction)
- iamzeus.io (for the password and identity manager Zeus - under construction)

### Status, description and current progress

*Give a description of the current progress of your project. Also add links to code repositories, articles, websites or other resources that you have been working on, that are relevant to this project.*
 
#### Background and concept.
 
Powered by the Zenon network, IAM-Z will provide the tools required to protect and manage both our confidential information as well as our online identity in the web 3.0 economy. From advanced password management capabilities (Zeus) including an identity vault, all the way to a fully fledged protocol for self-sovereign identities (zID), IAM-Z will facilitate the sovereignty we deserve.

Please refer to [this medium article](https://medium.com/@2bonahill/iam-z-a0a9256813f8) to find out more about Zeus and the whole IAM-Z ecosystem.

#### Current progress

 - First prototype of Zeus currently under development (fka. zPass). See screenshots [here](https://twitter.com/2bonahill/status/1460197832103809024) and [here](https://twitter.com/2bonahill/status/1468229505730945036).
 - Zeus is the password manager built for iOS and Android, using state of the art encryption (leveraging the zenon dart sdk wallet) and the Network of Momentum to store and protect the user's secrets
 - Code repository to Zeus: [IAM-Z Code Repository](https://github.com/iamznetwork/zeus). Note: This is work in progress.
 - Website: iamzeus.io (website under construction).
 
#### Impact
 
 *Why and how would your project idea help Zenon Network to grow, increase its reach or make it more accesible. What’s the benefit for the community. What features would your project provide that are not present yet.*

Identity provision and verification is a problem we have solved very well in the analog world for many decades. Based on our real world identifiers like our faces, names or physical fingerprints we can acquire various credentials like our passports, ID cards, library cards or drivers licenses. These credentials are issued by trusted entities, like e.g. the driver’s license office. At this stage we can disclose our credentials to a verifier in order to get access to goods and services (e.g. showing the driver’s license at a car rental station). It is then up to the verifier (e.g. the owner of the car rental station) to verify the credentials presented to her. And because we all trust the government office issuing the driver’s license, this system works perfectly and has a major benefit: We have selective disclosure of our credentials, in our case meaning the the owner of the car rental station will learn nothing more about us except the fact that we took and passed the drivers test (and that we are of a at least a certain age). And even better: the driver’s license office will never learn about your latest trip.

The beautiful system described in the section before is broken in the digital world of the web 2.0 where our identifiers are issued by big corporations and platforms like Facebook (Facebook ID) or Google (Google ID), making those companies de facto the owner of our digital identities. And as a consequence of the fact that these identifiers do not belong to us anymore, we have lost control and ownership of not only our digital identities (see latest de-platforming activities), but also of our data. Making it even worse, using federation and OAuth we let those platforms act as our identity providers and learn even more about us every time we use social logins to access other services (e.g. Facebook Login).

IAM-Z brings the beautiful system as we know it from the analog world to the digital world using the Zenon network.

The mission is to let us be the sole owner of our digital identities again, gaining full control over our credentials and thus our data. It will facilitate full control over what data is shared at any given time, making authentication to future zApps as easy, secure and smooth as possible.

#### Ambitions 
 
 *What is the goal that you want to achieve with your project in the next 6 months. What are the features you want to implement, studies you want to carry out, areas you want to expand to in that timeframe.*

 Over the next 6 months the goals are:
 - Finish implementation of Zeus v1.0 and release it for iOS and Android
 - Setting up the webpages for iamz.network and iamzeus.io
 - Carry out studies for how to integrate the W3C DID (zID) standard into Zenon and how to model the roles involved (claimer, attester, verifier etc.)

#### Uniqueness 
 
 *If there are other, similar initiatives, either by Zenon or the community, please list those and tell us what sets or will set your ideas apart*

As far as I know, there is no similar project at the moment. Nevertheless I don't know whether the Zenon core team is already working on a DID implemenation themselves. If so, I would be more than happy to support :-) 

#### Expenses 

*Given your ambitions for the next 6 months, will you have necessary expenses, e.g. for infrastructure cost or payment of participators?*

There will be smaller expenses in the context of domain acquisition and website setup. I might take some unpaid leave from my job in order to make further progress which would result in loss of income. But mainly, expenses will be around "precious time". Some Zenon Community Aliens already offered me support which I will accept gladly, but there will be no payment for the first phase.

#### Stepstones

*Given your ambitions for the next 6 months, please define two to four interim results or milestones that you aim to achieve, and that would help us evaluating the progress you are making.*

The next 6 months will be heavily focused on the Zeus app:
- Complete Zeus core functionality: Storing different kind of secrets and using state of the art encryption to fully secure the data.
- Implementation of advanced Zeus capabilities (e.g. auto-fill for iOS and Android, Secret sharing, recovery and inheritanZe features).
- Putting the encrypted secrets on to the Network of Momentum (secure backup on and recovery from the Zenon network).
- Drafting a more detailed solution architecture blueprint for setting up the decentralized identity ecosystem (zID) within the Zenon network. 

Please note: In order to enter phase 2 (the DID implementation), smart contract functionality will be required on the Zenon network. 

#### Accelerator-Z 

*Do you currently think that you’ll likely want to apply to Accelerator-Z, provided received funding helps you achieve near-term goals?*

Yes. My plan is to complete the first component (Zeus) by myself, hopefully with the support of some #WarpDrive funding and the help of other developers in the Zenon ecosystem. But for the second phase of IAM-Z, the distributed identifier ecosystem (zID) on the Zenon network, I will definitely have to scale up both in terms of funding and team.
