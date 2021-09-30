import React from 'react';
import BlogBanner from '../PageBanners/BlogBanner';
import Content from '../Blog/Content';
import Footer from '../Common/Footer';
 
class Blog extends React.Component {
    render(){
        return (
            <>
                <BlogBanner />

                <Content />
                
                <Footer />
            </>
        );
    }
}
 
export default Blog;