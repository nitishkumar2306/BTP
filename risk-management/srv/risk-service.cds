using {riskmanagement as rm} from '../db/schema.cds';

@path: 'service/risk'
service RiskService {
    entity Risks as projection on rm.Risks;
    annotate Risks with @odata.draft.enabled;

    entity Mitigations as projection on rm.Mitigations;

    // BusinessPartner will be used later
    //@readonly entity BusinessPartners as projection on rm.BusinessPartners;
}