import React, { Component } from 'react';
import DemoSidebarContent from './DemoSidebarContent';

class DemoSidebar extends Component {

    state = {
        sidebarModal: false
    };

    toggleModal = () => {
        this.setState({
            sidebarModal: !this.state.sidebarModal
        });
    }

    render() {
        return (
            <React.Fragment>
                <div className="demo-modal-panel" onClick={this.toggleModal}>
                    <button className="sidebar-demo-control">
                        <span>Demos</span>
                    </button>
                </div>

                <DemoSidebarContent onClick={this.toggleModal} active={this.state.sidebarModal ? 'active' : ''} />
            </React.Fragment>
        );
    }
}

export default DemoSidebar;