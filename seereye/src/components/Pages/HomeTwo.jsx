import React from 'react'
import MainBanner from '../PageBanners/MainBannerTwo';
import Strategy from '../Common/Strategy';
import WhoWeAre from '../Common/WhoWeAre';
import Ctr from '../Common/Ctr';
import Team from '../Common/Team';
import Faq from '../Common/Faq';
import Contact from '../Common/Contact';
import Footer from '../Common/Footer';
import GoTop from '../Common/GoTop';

class HomeTwo extends React.Component {
  render() {
    return (
      <>
        {/* Main Banner */}
        <MainBanner />

        {/* Team Area */}
        <Team />

        {/* Who We Are Area */}
        <WhoWeAre />

        {/* Strategy Area */}
        <Strategy />

        {/* FAQ Area */}
        <Faq />

        {/* CTR Area */}
        <Ctr />

        {/* Contact Area */}
        <Contact />

        {/* Footer Area */}
        <Footer />
        <GoTop scrollStepInPx="50" delayInMs="16.66" />
      </>
    );
  }
}

export default HomeTwo;