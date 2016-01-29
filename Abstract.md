### Abstract

Networking has a long history of being operationally reactive to incidents that affect service delivery. In the average data center today, the data that can often provide the early warning to upcoming events still remain either a needle in the haystack of enormous amounts of data or more often then not, never even collected. It is not because NetOps wouldn't find some degree of predictive analysis or even a coarse summarization valuable considering their number one performance metric is network availability.

While there has been significant improvements in configuration management, what is still in the stone ages is collecting, processing and analyzing ephemeral network state. There are various reasons why this is still such a problem today that include, a high cost of commercial products, overly complex (and dated) open source and commercial tools and the high OpEx associated with the care and feeding required to deploy and manage systems network state data and the processing of those workloads.

Fortunately, networking is not excluded from the disruption that Application virtualization presents. Rather then trying to collect the massive amounts of network state data in a centralized fashion, it makes much more sense to follow the data and preprocess workloads at the edge and move only the interesting data required for a global view of the network while still maintaining the ability to drill down into the finer grained metrics required for routine capacity planning and network troubleshooting.

This Docker usage example focuses on how NetOps can use Docker to combine open source projects and a bit of integration to collect data on the edge of the network inside of portable Docker containers running open source code containing the granular view of the localhost. This distributed approach also presents a CapEx of cost avoidance and savings enabled in a scale-out/elastic infrastructure.

Along with the data collection harness consisting of the edge collectors and pre-processors it also consists of a central viewer to process analytical results based on user defined profiles containing metrics and a visualization of the global network state.

The raw data from the network is more times then not managed by a single group and very rarely sharable in a flexible enough fashion for the various groups to have meaningful use. The ability to pull from distributed collectors only relavant data enables all interested parties to gain visibility while keeping the cost of collection at a fraction of today's prevalant centralized model. Here are some simple examples of the differnce in profiles from standard groups in the enterprise currently:

1) NetEng / NetArch wants capacity planning focused profiles to see long term BW aggregates and spikes.

2) CISSPs responsible for security prevention and breach analysis want realtime threat alerts, replay and long term trends to predict future attacks.

3) NetOps wants realtime performance and a useful dashboard to coordinate during outages to quickly isolate the root of an incident and restore service.

The overarching goal is to present an emerging network ops/eng pattern that enables packaging profiles for users to enable them to focus on managing the applications important to networks rather then users slogging through the often tedious setup of complex frameworks just to get basic compute provisioned.
