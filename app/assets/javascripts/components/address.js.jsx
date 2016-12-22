let Address = React.createClass({
  getInitialState() {
    return {
      editable: false
    }
  },

  country() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.country} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.country}</h4>
      )
    }
  },

  stateProvinceCounty() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.state_province_county} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.state_province_county}</h4>
      )
    }
  },

  city() {
    if(this.state.editable) {
      return (
        <input type="text" defaultValue={this.props.city} className='form-control'/>
      )
    } else {
      return (
        <h4 onClick={this.handleClick} >{this.props.city}</h4>
      )
    }
  },

  handleClick() {
    this.setState({editable: !this.state.editable});
  },

  handleCancel() {
    this.setState({editable:false});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleEdit} className="btn btn-sm btn-success">Update</button>
      )
    }
  },

  cancelButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleCancel} className="btn btn-sm btn-danger">Cancel</button>
      )
    }
  },

  btnGroup(){
    if (this.state.editable) {
      return (
        <div className="btn-group pull-right" style={{"margin-bottom": "25px"}}>
          <br/>
          { this.updateButton() }
          { this.cancelButton() }
          <br />
        </div>
      )
    }
  },

  render() {
    return (
      <div>
        <div className="col-xs-12">
          <h3>Address</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>County</h4>
          </div>
          <div className="col-xs-9">
            {this.country()}
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>State</h4>
          </div>
          <div className="col-xs-9">
            {this.stateProvinceCounty()}
          </div>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-3">
            <h4>City</h4>
          </div>
          <div className="col-xs-9">
            {this.city()}
          </div>
        </div>
        <div className="col-xs-12">
          {this.btnGroup()}
        </div>
      </div>
    )
  }
});
