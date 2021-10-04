import React from 'react'
import MainBanner from '../PageBanners/MainBannerTwo';
import Strategy from '../Common/Strategy';
import WhoWeAre from '../Common/WhoWeAre';
import Ctr from '../Common/Ctr';
import Services from '../Common/Services';
import Contact from '../Common/Contact';
import Footer from '../Common/Footer';
import GoTop from '../Common/GoTop';
import DemoSidebar from '../Common/DemoSidebar/DemoSidebar';
 
class HomeOne extends React.Component {
    render(){
        return (
            <>
                {/* Main Banner */}
                <MainBanner />

                {/* Services Area */}
                <Services />

                {/* Strategy Area */}
                <Strategy />

                {/* Who We Are Area */}
                <WhoWeAre />

                {/* CTR Area */}
                <Ctr />

                {/* Contact Area */}
                <Contact />

                {/* Footer Area */}
                <Footer />
                <GoTop scrollStepInPx="50" delayInMs="16.66" />
                
                {/* Demo Sidebar */}
                <DemoSidebar />
            </>
        );
    }
}
 
export default HomeOne;