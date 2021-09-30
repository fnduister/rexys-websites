import React, { Fragment } from 'react';
import AnchorLink from 'react-anchor-link-smooth-scroll';
import { Link, withRouter } from 'react-router-dom';
import logo from "../../assets/logos/logo_rexys.png";
import { withTranslation } from 'react-i18next';

class Navigation extends React.Component {
    state = {
        collapsed: true,
    };

    constructor(props) {
        super()
        // const { t, i18n} = useTranslation()
    }

    toggleNavbar = () => {
        this.setState({
            collapsed: !this.state.collapsed,
        });
    }

    componentDidMount() {
        let elementId = document.getElementById("navbar");
        document.addEventListener("scroll", () => {
            if (window.scrollY > 170) {
                elementId.classList.add("is-sticky");
                window.history.pushState("", document.title, window.location.pathname);
            } else {
                elementId.classList.remove("is-sticky");
            }
        });
        window.scrollTo(0, 0);

        if (!(window.location.pathname === '/blog' || window.location.pathname === '/blog-details')) {
            let mainNavLinks = document.querySelectorAll("nav ul li a");

            window.addEventListener("scroll", () => {
                let fromTop = window.scrollY;

                mainNavLinks.forEach(link => {
                    let section = document.querySelector(link.hash);

                    if (
                        section.offsetTop <= fromTop &&
                        section.offsetTop + section.offsetHeight > fromTop
                    ) {
                        link.classList.add("active");
                    } else {
                        link.classList.remove("active");
                    }
                });
            });
        }
    }

    handleChangeLanguage = (lgn) => {
        console.log("changing: ", this.props.i18n.language)
        this.props.i18n.changeLanguage(lgn);
    }

    goToId = (e) => {
        window.location.hash = e;
        window.location.refresh(true);
    }

    renderMenus = () => {
        if (window.location.pathname === '/blog' || window.location.pathname === '/blog-details') {
            return (
                <ul className="navbar-nav ms-auto">
                    <li className="nav-item">
                        <Link className="nav-link" to="/#home">{this.props.t("header.navigation.home")}</Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            to="/#about"
                            onClick={() => this.goToId("/#about")}
                        >
                            About
                        </Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            to="/#team"
                            onClick={() => this.goToId("/#team")}
                        >Team</Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            to="/#services"
                            onClick={() => this.goToId("/#services")}
                        >Services</Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            to="/#work"
                            onClick={() => this.goToId("/#work")}
                        >Work</Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            to="/#price"
                            onClick={() => this.goToId("/#price")}
                        >Price</Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            to="/#blog"
                            onClick={() => this.goToId("/#blog")}
                        >Blog</Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            to="/#contact"
                            onClick={() => this.goToId("/#contact")}
                        >Contact</Link>
                    </li>
                    <li className="nav-item">
                        <Link
                            className="nav-link"
                            onClick={() => this.handleChangeLanguage('en')}
                        >{this.props.i18n.language !== 'fr' ? 'fr' : 'en'}</Link>
                    </li>
                </ul>
            );
        }

        return (
            <Fragment>

                <ul className="navbar-nav ms-auto">
                    <li className="nav-item">
                        <AnchorLink onClick={this.toggleNavbar} offset={() => 85} className="nav-link" href="#home">{this.props.t("header.navigation.home")}</AnchorLink>
                    </li>
                    <li className="nav-item">
                        <AnchorLink onClick={this.toggleNavbar} offset={() => 85} className="nav-link" href="#services">Services</AnchorLink>
                    </li>
                    <li className="nav-item">
                        <AnchorLink onClick={this.toggleNavbar} offset={() => 85} className="nav-link" href="#strategy">Strategy</AnchorLink>
                    </li>
                    <li className="nav-item">
                        <AnchorLink onClick={this.toggleNavbar} offset={() => 85} className="nav-link" href="#whoweare">About</AnchorLink>
                    </li>
                    <li className="nav-item">
                        <AnchorLink onClick={this.toggleNavbar} offset={() => 85} className="nav-link" href="#contact">Contact</AnchorLink>
                    </li>


                </ul>
                <li className="nav-item">
                    <button type="button" className="language btn btn-link"
                        
                        onClick={() => this.handleChangeLanguage(this.props.i18n.language !== 'fr' ? 'fr' : 'en')}
                    >{this.props.i18n.language !== 'fr' ? 'FR' : 'EN'}
                    </button>
                </li>
            </Fragment>
        );
    }

    render() {
        const { collapsed } = this.state;
        const classOne = collapsed ? 'collapse navbar-collapse' : 'navbar-collapse collapse show';
        const classTwo = collapsed ? 'navbar-toggler navbar-toggler-right collapsed' : 'navbar-toggler navbar-toggler-right';
        return (
            <nav id="navbar" className="navbar navbar-expand-md navbar-light bg-light header-sticky">
                <div className="container">
                    <Link
                        className="navbar-brand"
                        to="/"
                        onClick={() => window.location.refresh()}
                    >
                        <img
                            src={logo}
                            alt="client"
                        />
                        <span>R</span>exys
                    </Link>
                    <button
                        onClick={this.toggleNavbar}
                        className={classTwo}
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                    >
                        <span className="navbar-toggler-icon"></span>
                    </button>

                    <div className={classOne} id="navbarSupportedContent">
                        {this.renderMenus()}
                    </div>
                </div>
            </nav>
        );
    }
}

export default withRouter(withTranslation()(Navigation));