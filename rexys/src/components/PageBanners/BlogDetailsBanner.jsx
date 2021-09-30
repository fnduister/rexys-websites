import React from 'react';
import { Link } from 'react-router-dom';
 
class BlogDetailsBanner extends React.Component {
    render(){
        return (
            <div className="page-title item-bg-two">
                <div className="d-table">
                    <div className="d-table-cell">
                        <div className="container">
                            <div className="row">
                                <div className="col-lg-12 col-md-12">
                                    <div className="relative">
                                        <h1>Single Post</h1>
                                        <ul>
                                            <li><Link to="/">Home</Link></li>
                                            <li><i className="fa fa-angle-right"></i></li>
                                            <li className="active">Blog</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}
 
export default BlogDetailsBanner;