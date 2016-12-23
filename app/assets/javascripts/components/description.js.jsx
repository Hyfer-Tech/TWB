let Description = React.createClass({
  getInitialState() {
    return {
      editable: false,
      description: this.props.description
    }
  },

  description() {
    if(this.state.editable) {
      return (
        <input onChange={this.onChange} type="text" defaultValue={this.state.description} className='form-control'/>
      )
    } else {
      return (
        <span onClick={this.handleClick} >{this.state.description}</span>
      )
    }
  },

  onChange(e) {
    let description = e.target.value;
    this.setState({description});
  },

  handleClick() {
    if(this.state.editable) {
      let updated_user_info = { description: this.state.description }
      this.props.handleUpdate(updated_user_info);
    }
    this.setState({editable: !this.state.editable});
  },

  valid() {
    return this.state.description;
  },

  handleCancel() {
    this.setState({editable:false, description: this.props.description});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleClick} className="btn btn-sm btn-success" disabled={!this.valid()}>Update</button>
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
        <div className="btn-group pull-right" style={{marginBottom: "25px"}}>
          <br />
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
          <h3>Description</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-12">
            {this.description()}
          </div>
          <div className="col-xs-12">
            {this.btnGroup()}
          </div>
        </div>
      </div>
    )
  }
})
