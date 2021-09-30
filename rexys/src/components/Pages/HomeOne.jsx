import React from 'react'
import MainBanner from '../PageBanners/MainBannerOne';
import Welcome from '../Common/Welcome';
import About from '../Common/About';
import Strategy from '../Common/Strategy';
import WhoWeAre from '../Common/WhoWeAre';
import Ctr from '../Common/Ctr';
import Skill from '../Common/Skill';
import Funfact from '../Common/Funfact';
import Team from '../Common/Team';
import HowWeWork from '../Common/HowWeWork';
import Services from '../Common/Services';
import WhyWeDifferent from '../Common/WhyWeDifferent';
import Work from '../Common/Work';
import Price from '../Common/Price';
import Faq from '../Common/Faq';
import Testimonial from '../Common/Testimonial';
import Blog from '../Common/Blog';
import Partner from '../Common/Partner';
import Subscribe from '../Common/Subscribe';
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